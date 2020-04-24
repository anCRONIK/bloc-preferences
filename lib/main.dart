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
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Logger log = Logger('MyApp');

  @override
  Widget build(BuildContext context) {
    //lets make our app portrait only
    log.finest("Building my app");

    return BlocProvider(
      create: (context) => getIt<AppPreferencesBloc>(),
      child: BlocBuilder<AppPreferencesBloc, AppPreferencesBlocState>(
        builder: _appPreferenceBlocBuilder,
      ),
    );
  }

  /// Method for handling [AppPreferencesBlocState] states
  Widget _appPreferenceBlocBuilder(BuildContext context, AppPreferencesBlocState blocState) {
    return blocState.when(loaded: (AppPreferences appPreferences) {
      log.finest("Loaded app preferences: $appPreferences");
      return _createMaterialApp(appPreferences, context);
    }, error: (AppPreferences appPreferences, Failure failure) {
      log.finest("Error occured $failure, preferences: $appPreferences");
      return _createMaterialApp(appPreferences, context);
    });
  }

  Widget _createMaterialApp(AppPreferences appPreferences, BuildContext context) {
    return MaterialApp(
        darkTheme: darkTheme,
        localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
        supportedLocales: supportedLanguages.keys.map<Locale>((locale) => Locale(locale)),
        locale: Locale(appPreferences.locale),
        theme: appPreferences.appTheme == appThemes[0] ? lightTheme : darkTheme,
        home: const HomePage(),);
  }
}
