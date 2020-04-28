// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:blocpreferences/features/application_preferences/presentation/util/app_preferences_input_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blocpreferences/dependency_injection.dart';
import 'package:blocpreferences/features/application_preferences/data/repositories/translation_file_repository_impl.dart';
import 'package:blocpreferences/features/application_preferences/domain/repositories/translation_file_repository.dart';
import 'package:blocpreferences/features/application_preferences/data/datasources/preferences_datasource.dart';
import 'package:blocpreferences/features/application_preferences/data/repositories/app_preferences_repository_impl.dart';
import 'package:blocpreferences/features/application_preferences/domain/repositories/app_preferences_repository.dart';
import 'package:blocpreferences/features/application_preferences/domain/usecases/get_and_store_app_preferences.dart';
import 'package:blocpreferences/features/application_preferences/domain/usecases/translator.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final registerModule = _$RegisterModule();
  g.registerLazySingleton<AppPreferencesInputValidator>(
      () => AppPreferencesInputValidator());
  final sharedPreferences = await registerModule.prefs;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerFactory<String>(() => registerModule.localeAssetsPath,
      instanceName: 'LocaleAssetsPath');
  g.registerFactory<TranslationFileRepository>(() =>
      TranslationFileRepositoryImpl(
          g<String>(instanceName: 'LocaleAssetsPath')));
  g.registerFactory<PreferencesDataSource>(
      () => PreferencesDataSourceImpl(g<SharedPreferences>()));
  g.registerFactory<AppPreferencesRepository>(
      () => AppPreferencesRepositoryImpl(g<PreferencesDataSource>()));
  g.registerLazySingleton<GetAndStoreAppPreferences>(
      () => GetAndStoreAppPreferences(g<AppPreferencesRepository>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<Translator>(Translator(
      g<TranslationFileRepository>(), g<AppPreferencesRepository>()));
}

class _$RegisterModule extends RegisterModule {}
