import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dependency_injection.iconfig.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(Environment environment) async => $initGetIt(getIt, environment: environment.toString());

@registerModule
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  @Named("LocaleAssetsPath")
  String get localeAssetsPath => "assets/i18n/";
}

enum Environment { DEV, PROD, TEST }
