import 'package:shared_preferences/shared_preferences.dart';

const _isDarkModeKey = "is_dark_mode";

class PreferencesService {
  PreferencesService(SharedPreferences preferences) {
    _preferences = preferences;
  }

  late SharedPreferences _preferences;

  bool get darkMode => _preferences.getBool(_isDarkModeKey) ?? false;

  set darkMode(bool value) => _preferences.setBool(_isDarkModeKey, value);
}
