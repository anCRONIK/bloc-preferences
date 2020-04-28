import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:blocpreferences/core/error/failures.dart';
import 'package:blocpreferences/features/application_preferences/domain/entities/app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/domain/usecases/get_and_store_app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/presentation/bloc/bloc.dart';
import 'package:blocpreferences/features/application_preferences/presentation/util/app_preferences_input_validator.dart';

class MockGetAndStoreAppPreferences extends Mock implements GetAndStoreAppPreferences {}

class MockAppPreferencesInputValidator extends Mock implements AppPreferencesInputValidator {}

void main() {
  MockGetAndStoreAppPreferences mockGetAndStoreAppPreferences;
  AppPreferencesBloc preferenceBloc;
  MockAppPreferencesInputValidator mockInputValidator;

  setUp(() {
    mockGetAndStoreAppPreferences = MockGetAndStoreAppPreferences();
    mockInputValidator = MockAppPreferencesInputValidator();
    //arrange initial values
    when(mockGetAndStoreAppPreferences.getValues()).thenReturn(AppPreferences.initial());

    preferenceBloc = AppPreferencesBloc(mockGetAndStoreAppPreferences, mockInputValidator);
  });

  tearDown(() {
    preferenceBloc?.close();
  });

  test('initialState should be loaded', () {
    // assert
    expect(preferenceBloc.initialState, equals(AppPreferencesBlocState.loaded(AppPreferences.initial())));
  });

  group('update preference', () {
    const tPreference = AppPreferences.keyUnitSystem;
    final tValue = unitSystems[1];
    final tRetVal = AppPreferences.initial();
    tRetVal.unitSystem = tValue;

    test(
      'should call the validator when update is requested',
      () async {
        // arrange
        when(mockInputValidator.validate(preference: anyNamed("preference"), value: anyNamed("value"))).thenReturn(Failure());
        when(mockGetAndStoreAppPreferences.updateValue(preference: tPreference, value: tValue)).thenAnswer((_) => Future.value(null));
        // act
        preferenceBloc.add(AppPreferenceBlocEvent.update(preference: tPreference, value: tValue));
        await untilCalled(mockInputValidator.validate(preference: anyNamed("preference"), value: anyNamed("value")));
        // assert
        verify(mockInputValidator.validate(preference: tPreference, value: tValue));
      },
    );

    blocTest(
      'get validator failure on store event',
      build: () async {
        when(mockGetAndStoreAppPreferences.getValues()).thenReturn(AppPreferences.initial());
        when(mockInputValidator.validate(preference: anyNamed("preference"), value: anyNamed("value"))).thenReturn(UnsupportedValueFailure());
        return preferenceBloc;
      },
      act: (bloc) => bloc.add(AppPreferenceBlocEvent.update(preference: tPreference, value: tValue)) as Future,
      expect: [AppPreferencesBlocState.error(UnsupportedValueFailure())],
    );

    blocTest(
      'validator success, but update fails',
      build: () async {
        when(mockGetAndStoreAppPreferences.getValues()).thenReturn(AppPreferences.initial());
        when(mockInputValidator.validate(preference: anyNamed("preference"), value: anyNamed("value"))).thenReturn(null);
        when(mockGetAndStoreAppPreferences.updateValue(preference: anyNamed("preference"), value: anyNamed("value"))).thenAnswer((_) => Future.value(WriteFailure()));
        return preferenceBloc;
      },
      act: (bloc) => bloc.add(AppPreferenceBlocEvent.update(preference: tPreference, value: tValue)) as Future,
      expect: [AppPreferencesBlocState.error(WriteFailure())],
    );

    blocTest(
      'validator success, update success',
      build: () async {
        when(mockInputValidator.validate(preference: anyNamed("preference"), value: anyNamed("value"))).thenReturn(null);
        when(mockGetAndStoreAppPreferences.updateValue(preference: anyNamed("preference"), value: anyNamed("value"))).thenAnswer((_) => Future.value(null));
        when(mockGetAndStoreAppPreferences.getValues()).thenReturn(tRetVal);
        return AppPreferencesBloc(mockGetAndStoreAppPreferences, mockInputValidator);
      },
      act: (bloc) => bloc.add(AppPreferenceBlocEvent.update(preference: tPreference, value: tValue)) as Future,
      expect: [], //we would need to get loaded event, but we can't mock to get two different values from [mockGetAndStoreAppPreferences]
    );
  });
}
