import 'package:flutter_test/flutter_test.dart';
import 'package:blocpreferences/core/error/failures.dart';
import 'package:blocpreferences/features/application_preferences/domain/entities/app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/presentation/util/app_preferences_input_validator.dart';

void main() {
  AppPreferencesInputValidator inputValidator;

  setUp((){
    inputValidator = AppPreferencesInputValidator();
  });

  test('unsupported locale, return failure', (){
    //act
    final result = inputValidator.validate(preference: AppPreferences.keyLocale, value: "roki");
    //assert
    expect(result is InvalidValueFailure, true);
  });

  test('supported locale, return true', (){
    //act
    final result = inputValidator.validate(preference: AppPreferences.keyLocale, value: "en");
    //assert
    expect(result, null);
  });


  test('invalid value type, return failure', (){
    //act
    final result = inputValidator.validate(preference: AppPreferences.keyUnitSystem, value: "metricinjo");
    //assert
    expect(result is InvalidValueFailure, true);
  });

  test('nonexisting key, return failure', (){
    //act
    final result = inputValidator.validate(preference: "pero", value: "roki");
    //assert
    expect(result is UnsupportedValueFailure, true);
  });

}
