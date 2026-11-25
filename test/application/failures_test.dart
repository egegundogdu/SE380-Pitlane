import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/application/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

SyncFailure server(String code, String message) =>
    classifySyncError(PostgrestException(message: message, code: code));

void main() {
  group('a failed send', () {
    test('is a version conflict only for the server version markers', () {
      expect(server('40001', 'VERSION_CONFLICT').kind, SyncFailureKind.version);
      expect(
        server('40001', 'RECORD_DELETED').message,
        'Kayıt başka bir cihazdan silinmiş.',
      );
      expect(
        server('40001', 'FILE_CLEANUP_IN_PROGRESS').kind,
        SyncFailureKind.retryLater,
      );
    });

    test('is a refusal with a Turkish reason for rule violations', () {
      final odometer = server('23514', 'ODOMETER_CONFLICT');
      expect(odometer.kind, SyncFailureKind.rejected);
      expect(odometer.message, startsWith('Kilometre, başka tarihli'));
      final constraint = server(
        '23514',
        'new row for relation "vehicles" violates check constraint '
            '"vehicles_year_check"',
      );
      expect(constraint.kind, SyncFailureKind.rejected);
      expect(constraint.message, isNot(contains('vehicles')));
      expect(
        server('42501', 'ACCOUNT_UNAVAILABLE').message,
        startsWith('Hesap silme talebi'),
      );
    });

    test('waits for later when the server or session is not ready', () {
      for (final code in ['PGRST301', '503', '57014', '08006', '40P01']) {
        expect(
          server(code, 'x').kind,
          SyncFailureKind.retryLater,
          reason: code,
        );
      }
    });

    test('from Storage depends on the status', () {
      expect(
        classifySyncError(
          const StorageException('Payload too large', statusCode: '413'),
        ).message,
        startsWith('Dosya çok büyük'),
      );
      expect(
        classifySyncError(const StorageException('Failed to fetch')).kind,
        SyncFailureKind.offline,
      );
    });

    test('on the device is set aside with its own message', () {
      final lost = classifySyncError(StateError('Kopya yok.'));
      expect(lost.kind, SyncFailureKind.local);
      expect(lost.message, 'Kopya yok.');
      expect(
        classifySyncError(const SocketException('Failed host lookup')).kind,
        SyncFailureKind.offline,
      );
    });
  });

  group('what the user reads', () {
    test('has no Dart prefixes', () {
      expect(
        userMessage(ArgumentError('Kilometre çakışıyor.')),
        'Kilometre çakışıyor.',
      );
      expect(userMessage(StateError('Hesap değişti.')), 'Hesap değişti.');
      expect(userMessage(Exception('Fişi kontrol et.')), 'Fişi kontrol et.');
      expect(
        userMessage(UnsupportedError('Yalnızca telefonda.')),
        'Yalnızca telefonda.',
      );
    });

    test('names a missing connection instead of quoting the socket', () {
      expect(
        userMessage(const SocketException('Failed host lookup: example')),
        startsWith('Bağlantı kurulamadı'),
      );
    });

    test('for Supabase Auth is Turkish', () {
      expect(
        authMessage(
          const AuthApiException(
            'Token has expired or is invalid',
            statusCode: '403',
            code: 'otp_expired',
          ),
        ),
        startsWith('Kod hatalı ya da süresi dolmuş'),
      );
      expect(
        authMessage(
          const AuthApiException(
            'For security purposes, you can only request this after 52 seconds.',
            statusCode: '429',
            code: 'over_email_send_rate_limit',
          ),
        ),
        startsWith('Çok sık deneme'),
      );
      expect(
        authMessage(AuthRetryableFetchException(message: 'offline')),
        startsWith('Bağlantı kurulamadı'),
      );
      expect(
        authMessage(const AuthException('Something new')),
        'Giriş yapılamadı. Tekrar deneyin.',
      );
    });
  });
}
