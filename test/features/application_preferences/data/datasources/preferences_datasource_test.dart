import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:blocpreferences/core/error/exceptions.dart';
import 'package:blocpreferences/features/application_preferences/data/datasources/preferences_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  PreferencesDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = PreferencesDataSourceImpl(mockSharedPreferences);
  });

  group('getString', () {
    const tNotExistingKey = "nepostojeci";
    const tKey = "ROKI";
    const tStoredValue = "KRESO";

    test('key not found, throw exception', () {
      //arrange
      when(mockSharedPreferences.containsKey(tNotExistingKey)).thenReturn(false);
      //act
      //assert
      expect(() => dataSource.getString(tNotExistingKey), throwsA(KeyDoesNotExistsException()));
      verifyNever(mockSharedPreferences.getString(tNotExistingKey));
    });

    test('key valid, return stored value', () {
      //arrange
      when(mockSharedPreferences.containsKey(tKey)).thenReturn(true);
      when(mockSharedPreferences.getString(tKey)).thenReturn(tStoredValue);
      //act
      final result = dataSource.getString(tKey);
      //assert
      expect(result, tStoredValue);
      verify(mockSharedPreferences.getString(tKey));
    });
  });

  group('getBool', () {
    const tNotExistingKey = "nepostojeci";
    const tKey = "ROKI";
    const tStoredValue = true;

    test('key not found, throw exception', () {
      //arrange
      when(mockSharedPreferences.containsKey(tNotExistingKey)).thenReturn(false);
      //act
      //assert
      expect(() => dataSource.getBool(tNotExistingKey), throwsA(KeyDoesNotExistsException()));
      verifyNever(mockSharedPreferences.getString(tNotExistingKey));
    });

    test('key valid, return stored value', () {
      //arrange
      when(mockSharedPreferences.containsKey(tKey)).thenReturn(true);
      when(mockSharedPreferences.getBool(tKey)).thenReturn(tStoredValue);
      //act
      final result = dataSource.getBool(tKey);
      //assert
      expect(result, tStoredValue);
      verify(mockSharedPreferences.getBool(tKey));
    });
  });

  group('getNum', () {
    const tNotExistingKey = "nepostojeci";
    const tKey = "ROKI";
    const tStoredValue = 2.1;
    const tStoredValue2 = 2;

    test('key not found, throw exception', () {
      //arrange
      when(mockSharedPreferences.containsKey(tNotExistingKey)).thenReturn(false);
      //act
      //assert
      expect(() => dataSource.getBool(tNotExistingKey), throwsA(KeyDoesNotExistsException()));
      verifyNever(mockSharedPreferences.getString(tNotExistingKey));
    });

    test('key valid, return double stored value', () {
      //arrange
      when(mockSharedPreferences.containsKey(tKey)).thenReturn(true);
      when(mockSharedPreferences.getInt(tKey)).thenThrow(UnsupportedError("type 'x' is not a subtype of type 'y' in type cast"));
      when(mockSharedPreferences.getDouble(tKey)).thenReturn(tStoredValue);
      //act
      final result = dataSource.getNum(tKey);
      //assert
      expect(result, tStoredValue);
      verify(mockSharedPreferences.getDouble(tKey));
    });

    test('key valid, return int stored value', () {
      //arrange
      when(mockSharedPreferences.containsKey(tKey)).thenReturn(true);
      when(mockSharedPreferences.getInt(tKey)).thenReturn(tStoredValue2);
      //act
      final result = dataSource.getNum(tKey);
      //assert
      expect(result, tStoredValue2);
      verify(mockSharedPreferences.getInt(tKey));
      verifyNever(mockSharedPreferences.getDouble(tKey));
    });
  });

  group('storeString', () {
    const tKey = "ROKI";
    const tStoreValue = "KRESO";

    test('store returns false', () async {
      //arrange
      when(mockSharedPreferences.setString(tKey, tStoreValue)).thenAnswer((_) => Future.value(false));
      //act
      final result = await dataSource.storeString(tKey, tStoreValue);
      //assert
      expect(result, false);
    });

    test('some store error occured', () {
      //arrange
      when(mockSharedPreferences.setString(tKey, tStoreValue)).thenAnswer((_) => Future.error(Exception()));
      //act
      final result = dataSource.storeString(tKey, tStoreValue);
      //assert
      result.catchError((_error) =>   expect(_error.runtimeType, Exception));
    });

    test('store successfull', () async {
      //arrange
      when(mockSharedPreferences.setString(tKey, tStoreValue)).thenAnswer((_) => Future.value(true));
      //act
      dataSource.storeString(tKey, tStoreValue);
      //assert
      verify(mockSharedPreferences.setString(tKey, tStoreValue));
    });
  });

  group('storeBool', () {
    const tKey = "ROKI";
    const tStoreValue = true;

    test('store returns false', () async {
      //arrange
      when(mockSharedPreferences.setBool(tKey, tStoreValue)).thenAnswer((_) => Future.value(false));
      //act
      final result = await dataSource.storeBool(tKey, tStoreValue);
      //assert
      expect(result, false);
    });

    test('some store error occured', () {
      //arrange
      when(mockSharedPreferences.setBool(tKey, tStoreValue)).thenAnswer((_) => Future.error(Exception()));
      //act
      final result = dataSource.storeBool(tKey, tStoreValue);
      //assert
      result.catchError((_error) =>   expect(_error.runtimeType, Exception));
    });

    test('store successfull', () {
      //arrange
      when(mockSharedPreferences.setBool(tKey, tStoreValue)).thenAnswer((_) => Future.value(true));
      //act
      dataSource.storeBool(tKey, tStoreValue);
      //assert
      verify(mockSharedPreferences.setBool(tKey, tStoreValue));
    });
  });

  group('storeNum', () {
    const tKey = "ROKI";
    const tStoreValue = 2.1;
    const tStoreValue2 = 2;

    test('store double returns false', () async {
      //arrange
      when(mockSharedPreferences.setDouble(tKey, tStoreValue)).thenAnswer((_) => Future.value(false));
      //act
      final result = await dataSource.storeNum(tKey, tStoreValue);
      //assert
      expect(result, false);
    });

    test('store int returns false', () async {
      //arrange
      when(mockSharedPreferences.setInt(tKey, tStoreValue2)).thenAnswer((_) => Future.value(false));
      //act
      final result = await dataSource.storeNum(tKey, tStoreValue2);
      //assert
      expect(result, false);
    });

    test('some store error occured', () {
      //arrange
      when(mockSharedPreferences.setDouble(tKey, tStoreValue)).thenAnswer((_) => Future.error(Exception()));
      //act
      final result = dataSource.storeNum(tKey, tStoreValue);
      //assert
      result.catchError((_error) =>   expect(_error.runtimeType, Exception));
    });

    test('store double successfull', () async {
      //arrange
      when(mockSharedPreferences.setDouble(tKey, tStoreValue)).thenAnswer((_) => Future.value(true));
      //act
      dataSource.storeNum(tKey, tStoreValue);
      await untilCalled(mockSharedPreferences.setDouble(any, any));
      //assert
      verify(mockSharedPreferences.setDouble(tKey, tStoreValue));
      verifyNever(mockSharedPreferences.setInt(any, any));
    });


    test('store int successfull', () async {
      //arrange
      when(mockSharedPreferences.setInt(tKey, tStoreValue2)).thenAnswer((_) => Future.value(true));
      //act
      dataSource.storeNum(tKey, tStoreValue2);
      await untilCalled(mockSharedPreferences.setInt(any, any));
      //assert
      verify(mockSharedPreferences.setInt(tKey, tStoreValue2));
      verifyNever(mockSharedPreferences.setDouble(any, any));
    });

  });

}
