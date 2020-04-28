import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'core/error/failures.dart';
import 'core/i18n/translations.dart';
import 'core/presentation/themes.dart';
import 'dependency_injection.dart';
import 'features/application_preferences/domain/entities/app_preferences.dart';
import 'features/application_preferences/presentation/bloc/bloc.dart';
import 'features/test_app/presentation/pages/home_page.dart';
import 'logger.dart' as logconfig;

/// Main method for running this application
Future<void> main() async {
  //because of async make sure everything is loaded
  WidgetsFlutterBinding.ensureInitialized();

  logconfig.initLogger(Environment.DEV);

  //inject stuff
  await configureInjection(Environment.DEV);

  await initTranslator();

  runApp(MyApp());
}

/// Implementation of application
class MyApp extends StatelessWidget {

  final Logger log = Logger('MyApp');

  @override
  Widget build(BuildContext context) {
    //lets make our app portrait only
    log.finest("Building my app");

    return BlocProvider.value(
        value: getIt<AppPreferencesBloc>(),
        child: BlocBuilder<AppPreferencesBloc, AppPreferencesBlocState>(condition: (previous, current) {
          return current.when(loaded: (val) => true, error: (val) => false);
        }, builder: (context, state) {
          //here we should be only in loaded state
          return _createMaterialApp(context, (state as LoadedState).appPreferences);
        }));
  }


  /// Method for creating material applicaiton
  Widget _createMaterialApp(BuildContext context, AppPreferences appPreferences) {
    return MaterialApp(
        darkTheme: darkTheme,
        localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
        supportedLocales: supportedLanguages.keys.map<Locale>((locale) => Locale(locale)),
        locale: Locale(appPreferences.locale),
        theme: appPreferences.appTheme == appThemes[0] ? lightTheme : darkTheme,
        //if we add const, page won't be recreated on language change
        // ignore: prefer_const_constructors
        home: HomePage(),);
  }
}
