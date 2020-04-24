import 'dart:convert';
import 'dart:ui';

import 'package:either_option/either_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:blocpreferences/core/error/failures.dart';
import 'package:blocpreferences/features/application_preferences/domain/entities/app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/domain/repositories/app_preferences_repository.dart';
import 'package:blocpreferences/features/application_preferences/domain/repositories/translation_file_repository.dart';
import 'package:blocpreferences/features/application_preferences/domain/usecases/translator.dart';

class MockTranslationFileRepository  extends Mock implements TranslationFileRepository{}
class MockAppPreferencesRepository extends Mock implements AppPreferencesRepository {}


void main(){

  final MockTranslationFileRepository mockTranslationFileRepository = MockTranslationFileRepository();
  final MockAppPreferencesRepository mockAppPreferencesRepository = MockAppPreferencesRepository();
  Translator translator;
  
  const localeOk = "en";
  const localeNotOk = "roki";

  setUpAll((){
    translator = Translator(mockTranslationFileRepository, mockAppPreferencesRepository);
  });

  const String jsonTestData = '{"home": {"title": {"page":  "Home"}}}';

//with init we also test changeLanguage

  test('init default locale, no such translation file, return failure', () async {
    //arrange
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeNotOk))).thenAnswer((_) => Future.value(Right(ReadFailure())));
    when(mockTranslationFileRepository.loadJsonFile(Locale(supportedLanguages.keys.first))).thenAnswer((_) => Future.value(Right(ReadFailure())));
    //act
    final Failure f = await translator.init(true);
    //assert
    expect(f, ReadFailure());
  });

  test('init default locale, return data', () async {
    //arrange
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeNotOk))).thenAnswer((_) => Future.value(Right(ReadFailure())));
    when(mockTranslationFileRepository.loadJsonFile(Locale(supportedLanguages.keys.first))).thenAnswer((_) => Future.value(Left(json.decode(jsonTestData) as Map)));
    //act
    final Failure f = await translator.init(true);
    //assert
    expect(f, null);
  });

  test('could not init translations at all, return failure', () async {
    //arrange
    when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: anyNamed("type"))).thenReturn(Left(localeOk));
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeNotOk))).thenAnswer((_) => Future.value(Right(ReadFailure())));
    when(mockTranslationFileRepository.loadJsonFile(Locale(supportedLanguages.keys.first))).thenAnswer((_) => Future.value(Right(ReadFailure())));
    //act
    final Failure f = await translator.init(false);
    //assert
    expect(f, ReadFailure());
  });

  test('init from stored value, invalid locale stored, return failure', () async {
    //arrange
    when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: anyNamed("type"))).thenReturn(Left(localeNotOk));
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeNotOk))).thenAnswer((_) => Future.value(Right(ReadFailure())));
    //act
    final Failure f = await translator.init(false);
    //assert
    expect(f, UnsupportedValueFailure());
  });

  test('init sucessfull', () async {
    //arrange
    when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: anyNamed("type"))).thenReturn(Left(localeOk));
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeOk))).thenAnswer((_) => Future.value(Left(json.decode(jsonTestData) as Map)));
    //act
    final Failure f = await translator.init(false);
    //assert
    expect(f, isNull);
  });

  test('translate, key not found, return key', () async {
    //arrange
    when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: anyNamed("type"))).thenReturn(Left(localeOk));
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeOk))).thenAnswer((_) => Future.value(Left(json.decode(jsonTestData) as Map)));
    //act
    final Failure f = await translator.init(false);
    final String result = translator.translate("roki");
    //assert
    expect(f, isNull);
    expect(result, "roki");
  });

  test('translate, key found, return value', () async {
    //arrange
    when(mockAppPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: anyNamed("type"))).thenReturn(Left(localeOk));
    when(mockTranslationFileRepository.loadJsonFile(const Locale(localeOk))).thenAnswer((_) => Future.value(Left(json.decode(jsonTestData) as Map)));
    //act
    final Failure f = await translator.init(false);
    final String result = translator.translate("home.title.page");
    //assert
    expect(f, isNull);
    expect(result, "Home");
  });
  
}