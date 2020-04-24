import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/app_preferences.dart';
/// Class which will validate values for application preferences that are set in features.application_preferences.presentation layer and passed to features.application_preferences.domain layer.
@lazySingleton
class AppPreferencesInputValidator {

  /// Method for validating value [value] of the preference with given key [preference]. If the given key is not supported by the app or given value is not in valid
  /// proper instance of [Failure] will be returned, otherwise [null] will be returned.
  Failure validate({@required String preference, @required Object value}) {
    switch (preference) {
      //strings
      case AppPreferences.keyAppTheme:
        return appThemes.contains(value as String) ? null : InvalidValueFailure();
      case AppPreferences.keyUnitSystem:
        return unitSystems.contains(value as String) ? null : InvalidValueFailure();
      case AppPreferences.keyLocale:
        return supportedLanguages.keys.contains(value as String) ? null : InvalidValueFailure();

      // booleans
      //nums
      default:
        return UnsupportedValueFailure();
    }
  }
}
