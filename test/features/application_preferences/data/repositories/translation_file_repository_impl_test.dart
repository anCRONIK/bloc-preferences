import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blocpreferences/core/error/failures.dart';
import 'package:blocpreferences/dependency_injection.dart';
import 'package:blocpreferences/features/application_preferences/domain/entities/app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/domain/repositories/translation_file_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  TranslationFileRepository repository;

  setUpAll(() async{
    SharedPreferences.setMockInitialValues({});
    WidgetsFlutterBinding.ensureInitialized();
    await configureInjection(Environment.TEST);
    repository = getIt<TranslationFileRepository>();
  });

  test('translation json file does not exists, return error', () async {
    //arrange
    //act
    final result = await repository.loadJsonFile(const Locale("roki"));
    //assert
    expect(true, result.isRight);
    result.fold(null, (f){
      expect(ReadFailure(), f);
    });
  });

  //to access the assets we need to use testWidgets instead of test so that rootBundle will return proper value
  testWidgets('translation json file exists, return map of translations', (WidgetTester tester) async {
    //arrange

    //act
    final result = await repository.loadJsonFile(Locale(supportedLanguages.keys.first));
    //assert
    expect(true, result.isLeft);
    result.fold((json){
      expect(json["home"], isNotNull);
      expect(json["home"], isNotEmpty);
    }, null);
  });

}