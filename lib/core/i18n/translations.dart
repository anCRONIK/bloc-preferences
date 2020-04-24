import '../../dependency_injection.dart';
import '../../features/application_preferences/domain/usecases/translator.dart';
import '../error/failures.dart';


/// Method for getting translation text for the given key [key]. If there is no such value [key] will be returned, otherwise translation.
String translate(String key) {
  return getIt<Translator>().translate(key);
}

/// Method for changing the language. In case of some error [Failure] is returned, otherwise null.
Future<Failure> changeLanguage(String lang) {
  return getIt<Translator>().changeLanguage(lang);
}

/// Method to init translator, should be called from main method;
Future<void> initTranslator() async {
  Failure f = await getIt<Translator>().init(false);
  if (f != null) {
    f = await getIt<Translator>().init(false);
    if (f != null) {
      //TODO
      throw "application can not be initiliazed, pls reinstall!";
    }
  }
}
