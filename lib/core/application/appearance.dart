import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Light, dark or the phone's setting. A device preference, not account
/// data: it never syncs and survives signing out.
final themeModeProvider = NotifierProvider<ThemeModeSetting, ThemeMode>(
  ThemeModeSetting.new,
);

class ThemeModeSetting extends Notifier<ThemeMode> {
  static const _key = 'garaj.themeMode';

  /// Read once in `main` before the first frame, so the app never flashes the
  /// wrong theme on launch. Tests and web start from the phone's setting.
  static ThemeMode initial = ThemeMode.system;

  static Future<void> load() async {
    try {
      final saved = (await SharedPreferences.getInstance()).getString(_key);
      initial = ThemeMode.values.firstWhere(
        (mode) => mode.name == saved,
        orElse: () => ThemeMode.system,
      );
    } catch (_) {
      initial = ThemeMode.system;
    }
  }

  @override
  ThemeMode build() => initial;

  Future<void> select(ThemeMode mode) async {
    state = mode;
    initial = mode;
    try {
      await (await SharedPreferences.getInstance()).setString(_key, mode.name);
    } catch (_) {
      // Unavailable storage keeps the choice for this session only.
    }
  }
}
