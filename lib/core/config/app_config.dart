import 'package:flutter/foundation.dart';

abstract final class AppConfig {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const mapsKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');
  static const forcePreview = bool.fromEnvironment('GARAJ_PREVIEW');
  static bool get configured =>
      supabaseUrl.startsWith('https://') && supabaseKey.isNotEmpty;
  static bool get previewAllowed => kDebugMode || forcePreview;
}

abstract final class AppRuntime {
  static String userId = '';
  static bool preview = false;
}
