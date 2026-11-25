import 'package:supabase_flutter/supabase_flutter.dart';

/// What a failed send means for a queued record.
enum SyncFailureKind {
  /// No connection: keep the queue in order and wait for the network.
  offline,

  /// The server is busy or the session is being renewed: try again later.
  retryLater,

  /// Another device changed or deleted the record first.
  version,

  /// The server refused the record's values; only the user can resolve it.
  rejected,

  /// This device cannot send the record, for example its file is gone.
  local,

  /// Waited longer than the server remembers retries; the user confirms it.
  stale,
}

class SyncFailure {
  const SyncFailure(this.kind, this.message);
  final SyncFailureKind kind;

  /// Turkish, ready to show; never a raw server code.
  final String message;

  /// Set aside for the user, so the records queued behind it still go.
  bool get needsUser =>
      kind == SyncFailureKind.version ||
      kind == SyncFailureKind.rejected ||
      kind == SyncFailureKind.local ||
      kind == SyncFailureKind.stale;

  /// Later changes to the same record rest on this one as it was queued; when
  /// it waits for the user, they wait with it rather than go without it.
  bool get holdsChain =>
      kind == SyncFailureKind.version || kind == SyncFailureKind.stale;
}

const _offline = SyncFailure(
  SyncFailureKind.offline,
  'Kayıt cihazda bekliyor. Bağlantı kurulunca tekrar denenecek.',
);

SyncFailure classifySyncError(Object error) => switch (error) {
  PostgrestException() => _postgrest(error),
  StorageException() => _storage(error),
  AuthRetryableFetchException() => _offline,
  AuthException() => const SyncFailure(
    SyncFailureKind.retryLater,
    'Oturum yenileniyor. Kayıt yeniden denenecek.',
  ),
  StateError(:final message) => SyncFailure(SyncFailureKind.local, message),
  ArgumentError(:final message) when message is String => SyncFailure(
    SyncFailureKind.local,
    message,
  ),
  FormatException(:final message) => SyncFailure(
    SyncFailureKind.local,
    message,
  ),
  // A programming error repeats on every attempt; it must not pose as a
  // missing connection and hold back the rest of the queue.
  Error() => const SyncFailure(
    SyncFailureKind.local,
    'Kayıt bu cihazda hazırlanamadı. Kaldırıp yeniden ekleyin.',
  ),
  _ => _offline,
};

SyncFailure _postgrest(PostgrestException error) {
  final code = error.code ?? '';
  final text = error.message;
  if (text.contains('FILE_CLEANUP_IN_PROGRESS')) {
    return const SyncFailure(
      SyncFailureKind.retryLater,
      'Belge işlemi sürüyor. Kayıt yeniden denenecek.',
    );
  }
  if (code == '40001') {
    return SyncFailure(
      SyncFailureKind.version,
      text.contains('RECORD_DELETED')
          ? 'Kayıt başka bir cihazdan silinmiş.'
          : 'Bu kayıt başka bir cihazda değişmiş.',
    );
  }
  if (code.startsWith('PGRST3') || code == '401' || text.contains('JWT')) {
    return const SyncFailure(
      SyncFailureKind.retryLater,
      'Oturum yenileniyor. Kayıt yeniden denenecek.',
    );
  }
  // Connection, resource, timeout and lock states clear up by themselves.
  if (RegExp(r'^(08|53|57)').hasMatch(code) ||
      const {'40P01', '55P03', '429'}.contains(code) ||
      RegExp(r'^5\d\d$').hasMatch(code) ||
      RegExp(r'^PGRST00\d$').hasMatch(code)) {
    return const SyncFailure(
      SyncFailureKind.retryLater,
      'Sunucu şu an yanıt vermiyor. Kayıt yeniden denenecek.',
    );
  }
  return SyncFailure(SyncFailureKind.rejected, _refusal(code, text));
}

/// The server raises these markers itself (see the RPC migrations).
const _markers = {
  'ODOMETER_CONFLICT':
      'Kilometre, başka tarihli bir okumayla çelişiyor. Kaydı açıp '
      'kilometreyi düzeltin.',
  'FUTURE_DATE': 'Sunucu bu tarihi ileri tarih saydı. Tarihi kontrol edin.',
  'VEHICLE_NOT_FOUND':
      'Kaydın aracı bulunamadı; araç başka bir cihazdan silinmiş olabilir.',
  'VEHICLE_IMMUTABLE': 'Kaydın aracı sonradan değiştirilemez.',
  'ACCOUNT_UNAVAILABLE': 'Hesap silme talebi nedeniyle yeni kayıt alınmıyor.',
  'OWNERSHIP': 'Bu kayıt bu hesaba ait değil.',
  'FILE_NOT_FOUND': 'Belge sunucuda bulunamadı. Belgeyi yeniden ekleyin.',
  'FILE_RETIRED': 'Bu belge daha önce kaldırılmış. Belgeyi yeniden ekleyin.',
  'INVALID_FILE_PATH': 'Belge yolu geçersiz. Belgeyi yeniden ekleyin.',
  'OPERATION_ID_REUSED':
      'Kayıt farklı içerikle yeniden gönderildi. Kaldırıp yeniden ekleyin.',
  'UNKNOWN_OR_RESERVED_FIELD':
      'Sunucu bu kaydın bir alanını tanımadı. Uygulamayı güncelleyin.',
};

String _refusal(String code, String text) {
  for (final marker in _markers.entries) {
    if (text.contains(marker.key)) return marker.value;
  }
  return switch (code) {
    '23503' => 'Kaydın bağlı olduğu araç ya da istasyon sunucuda bulunamadı.',
    '23505' => 'Bu kayıt sunucuda zaten var.',
    '42501' => 'Bu işlem için yetki yok.',
    _ when code.startsWith('22') || code.startsWith('23') =>
      'Sunucu bazı değerleri kabul etmedi. Kaydı açıp değerleri kontrol edin.',
    _ => 'Sunucu kaydı kabul etmedi.',
  };
}

SyncFailure _storage(StorageException error) {
  final status = int.tryParse(error.statusCode ?? '');
  if (status == null || status >= 500 || status == 408 || status == 429) {
    return _offline;
  }
  return SyncFailure(SyncFailureKind.rejected, switch (status) {
    413 => 'Dosya çok büyük. Daha küçük bir dosya seçin.',
    415 => 'Bu dosya türü desteklenmiyor.',
    401 || 403 => 'Dosya yüklenemedi: bu hesap için yetki yok.',
    _ => 'Dosya sunucuya yüklenemedi.',
  });
}

/// What the user reads when an action fails: Turkish, without Dart's
/// "Invalid argument(s):" or "Bad state:" prefixes or raw server codes.
String userMessage(Object error) {
  switch (error) {
    case ArgumentError(:final message) when message is String:
      return message;
    case StateError(:final message):
      return message;
    case FormatException(:final message) when message.isNotEmpty:
      return message;
    case UnsupportedError(:final message?) when message.isNotEmpty:
      return message;
    case AuthException():
      return authMessage(error);
    case PostgrestException() || StorageException():
      return classifySyncError(error).message;
  }
  final text = error.toString();
  if (RegExp(
    r'SocketException|ClientException|TimeoutException|HandshakeException|'
    r'Failed host lookup|Connection (refused|reset|closed)',
  ).hasMatch(text)) {
    return 'Bağlantı kurulamadı. İnternet bağlantınızı kontrol edip tekrar '
        'deneyin.';
  }
  if (error is Exception && text.startsWith('Exception: ')) {
    return text.substring('Exception: '.length);
  }
  return 'Beklenmeyen bir hata oluştu. Tekrar deneyin.';
}

/// Supabase Auth answers in English; these are the cases sign-in meets.
String authMessage(AuthException error) {
  if (error is AuthRetryableFetchException) {
    return 'Bağlantı kurulamadı. İnternet bağlantınızı kontrol edip tekrar '
        'deneyin.';
  }
  return switch (error.code) {
    'otp_expired' =>
      'Kod hatalı ya da süresi dolmuş. Yeni bir kod isteyip tekrar deneyin.',
    'over_email_send_rate_limit' || 'over_request_rate_limit' =>
      'Çok sık deneme yapıldı. Bir süre bekleyip tekrar deneyin.',
    'email_address_invalid' ||
    'validation_failed' => 'E-posta adresini kontrol edin.',
    'signup_disabled' => 'Yeni hesap açma şu an kapalı.',
    'otp_disabled' => 'Kodla giriş şu an kapalı.',
    'session_not_found' ||
    'session_expired' ||
    'refresh_token_not_found' => 'Oturumun süresi doldu. Yeniden giriş yapın.',
    _ when error.statusCode == '429' =>
      'Çok sık deneme yapıldı. Bir süre bekleyip tekrar deneyin.',
    _ => 'Giriş yapılamadı. Tekrar deneyin.',
  };
}
