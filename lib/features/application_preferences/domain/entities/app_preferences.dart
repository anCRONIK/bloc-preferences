import 'package:equatable/equatable.dart';

/// Represents application preferences, e.g. contains some variable which are used globally inside application which user can customize to their needs.
/// It also provides default values for them.
class AppPreferences with EquatableMixin {
  final Map<String, Object> _preferences = {};

  AppPreferences();

  AppPreferences.populate(final Map<String, Object> populatePreferences) {
    _preferences.addAll(populatePreferences);
  }

  AppPreferences.initial() {
    _preferences[keyLocale] = supportedLanguages.keys.first;
    _preferences[keyAppTheme] = appThemes[0];
    _preferences[keyUnitSystem] = unitSystems[0];
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [_preferences];

  //getters and setters

  String get locale => _preferences[keyLocale] as String;

  set locale(String locale) => _preferences[keyLocale] = locale;

  String get appTheme => _preferences[keyAppTheme] as String;

  set appTheme(String appTheme) => _preferences[keyAppTheme] = appTheme;

  String get unitSystem => _preferences[keyUnitSystem] as String;

  set unitSystem(String unitSystem) => _preferences[keyUnitSystem] = unitSystem;

  Object valueForKey(String key) => _preferences[key];

  /// PREFERENCES KEYS
  static const String keyLocale = "locale";
  static const String keyAppTheme = "ui_theme";
  static const String keyUnitSystem = "unit_system";

  static const List<String> supportedKeys = [keyLocale, keyUnitSystem, keyAppTheme];
}

///Array of supported locales
const supportedLanguages = {
  "en":"English",
  "hr":"Hrvatski",
};

//Array of unit systems
const unitSystems = ["metric", "imperial"];
//available application material themes
const appThemes = ["light", "dark"];
