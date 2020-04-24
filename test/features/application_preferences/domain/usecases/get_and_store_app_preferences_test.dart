import 'package:either_option/either_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:blocpreferences/core/error/failures.dart';
import 'package:blocpreferences/features/application_preferences/domain/entities/app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/domain/repositories/app_preferences_repository.dart';
import 'package:blocpreferences/features/application_preferences/domain/usecases/get_and_store_app_preferences.dart';

class MockAppPreferencesRepository extends Mock implements AppPreferencesRepository {}

void main() {
  GetAndStoreAppPreferences usecase;
  MockAppPreferencesRepository mockAppPreferencesRepository;

  setUp(() {
    mockAppPreferencesRepository = MockAppPreferencesRepository();
    usecase = GetAndStoreAppPreferences(mockAppPreferencesRepository);
  });

  group('load', () {
    test('load preferences', () {
      //arrange
      when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyUnitSystem, type: String)).thenReturn(Left("roki"));
      when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: String)).thenReturn(Right(ReadFailure()));
      when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyAppTheme, type: String)).thenReturn(Left("dark"));
      //act
      final result = usecase.getValues();
      //assert
      expect(result.unitSystem, "roki");
      expect(result.appTheme, "dark");
      expect(result.locale, supportedLanguages.keys.first);
      verify(mockAppPreferencesRepository.getValue(preference: anyNamed("preference"), type: anyNamed("type")));
    });
  });
}
