import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:blocpreferences/core/error/exceptions.dart';
import 'package:blocpreferences/core/error/failures.dart';
import 'package:blocpreferences/features/application_preferences/data/datasources/preferences_datasource.dart';
import 'package:blocpreferences/features/application_preferences/data/repositories/app_preferences_repository_impl.dart';
import 'package:blocpreferences/features/application_preferences/domain/entities/app_preferences.dart';

class MockAppPreferencesDataSource extends Mock implements PreferencesDataSource {}

void main() {
  AppPreferencesRepositoryImpl repository;
  MockAppPreferencesDataSource mockAppPreferencesDataSource;

  setUp(() {
    mockAppPreferencesDataSource = MockAppPreferencesDataSource();
    repository = AppPreferencesRepositoryImpl(mockAppPreferencesDataSource);
  });


  group('getValue', () {
    test('invalid subtype failure', () {
      //arrange
      when(mockAppPreferencesDataSource.getString(any)).thenThrow(Exception(msg: "invalid subtype blalala"));
      //act
      final result = repository.getValue(preference: "roki", type: String);
      //assert
      expect(result.isRight, true);
      result.fold((v) {}, (f) {
        expect(f.runtimeType, ReadFailure);
      });
    });

    test('key not stored, handle non existing key exception', () {
      //arrange
      when(mockAppPreferencesDataSource.getString(any)).thenThrow(KeyDoesNotExistsException());
      //act
      final result = repository.getValue(preference: "roki", type: String);
      //assert
      expect(result.isRight, true);
      result.fold((v) {}, (f) {
        expect(f.runtimeType, KeyDoesNotExistsFailure);
      });
    });

    test('key stored, return valid value', () {
      const tKey2 = AppPreferences.keyUnitSystem;
      //arrange
      when(mockAppPreferencesDataSource.getString(tKey2)).thenReturn("kg");
      //act
      final result2 = repository.getValue(preference: tKey2, type: String);
      //assert
      expect(result2.isLeft, true);
      result2.fold((val) {
        expect(val, "kg");
      }, (f) {});
    });
  });

  group('storeValue', () {
    test('value not supported, return failure', () async {
      //arrange
      //act
      final result = await repository.storeValue(preference: "roki", value: Exception());
      //assert
      expect(result is Failure, true);
      verifyZeroInteractions(mockAppPreferencesDataSource);
    });

    test('error while storing features.application_preferences.data, return failure', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeString(any, any)).thenAnswer((_) => Future.value(false));
      //act
      final result = await repository.storeValue(preference: "roki", value: "pero");
      //assert
      expect(result is Failure, true);
    });

    test('test store successfull, return null', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeString(any, any)).thenAnswer((_) => Future.value(true));
      //act
      final result = await repository.storeValue(preference: "roki", value: "pero");
      //assert
      expect(result, null);
    });
  });

  group('storeString', () {
    const tStringKey = "ROKI";
    const tStringValue = "KRESO";

    test('store exception, return failure', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeString(tStringKey, tStringValue)).thenAnswer((_) => Future.error(Exception()));
      //act
      final result = await repository.storeString(tStringKey, tStringValue);
      //assert
      expect(result.runtimeType, WriteFailure);
      verify(mockAppPreferencesDataSource.storeString(tStringKey, tStringValue));
      verifyNoMoreInteractions(mockAppPreferencesDataSource);
    });

    test('store successfull, return null', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeString(tStringKey, tStringValue)).thenAnswer((_) => Future.value(true));
      //act
      final result = await repository.storeString(tStringKey, tStringValue);
      //assert
      expect(result, null);
      verify(mockAppPreferencesDataSource.storeString(tStringKey, tStringValue));
      verifyNoMoreInteractions(mockAppPreferencesDataSource);
    });
  });

  group('storeNum', () {
    const tNumKey = "numky";
    const tNumValue = 1.1;

    test('store exception, return failure', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeNum(tNumKey, tNumValue)).thenAnswer((_) => Future.error(Exception()));
      //act
      final result = await repository.storeNum(tNumKey, tNumValue);
      //assert
      expect(result.runtimeType, WriteFailure);
      verify(mockAppPreferencesDataSource.storeNum(tNumKey, tNumValue));
      verifyNoMoreInteractions(mockAppPreferencesDataSource);
    });

    test('store successfull, return null', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeNum(tNumKey, tNumValue)).thenAnswer((_) => Future.value(true));
      //act
      final result = await repository.storeNum(tNumKey, tNumValue);
      //assert
      expect(result, null);
      verify(mockAppPreferencesDataSource.storeNum(tNumKey, tNumValue));
      verifyNoMoreInteractions(mockAppPreferencesDataSource);
    });
  });

  group('storeBoolean', () {
    const tBoolKey = "boolky";
    const tBoolValue = false;

    test('store exception, throw failure', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeBool(tBoolKey, tBoolValue)).thenAnswer((_) => Future.error(Exception()));
      //act
      final result = await repository.storeBool(tBoolKey, tBoolValue);
      //assert
      expect(result.runtimeType, WriteFailure);
      verify(mockAppPreferencesDataSource.storeBool(tBoolKey, tBoolValue));
      verifyNoMoreInteractions(mockAppPreferencesDataSource);
    });

    test('store successfull, return null', () async {
      //arrange
      when(mockAppPreferencesDataSource.storeBool(tBoolKey, tBoolValue)).thenAnswer((_) => Future.value(true));
      //act
      final result = await repository.storeBool(tBoolKey, tBoolValue);
      //assert
      expect(result, null);
      verify(mockAppPreferencesDataSource.storeBool(tBoolKey, tBoolValue));
      verifyNoMoreInteractions(mockAppPreferencesDataSource);
    });
  });
}
