import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import '../../../../core/error/failures.dart';
import '../entities/app_preferences.dart';
import '../repositories/app_preferences_repository.dart';
import '../repositories/translation_file_repository.dart';

/// Class for getting stored translation depending on the set language.
@singleton
class Translator {
  final Logger log = Logger('Translator');

  final TranslationFileRepository _translationFileRepository;
  final AppPreferencesRepository _appPreferencesRepository;
  Locale _locale;
  Map<dynamic, dynamic> _localizedValues;
  Map<String, String> _cache = {};

  Translator(this._translationFileRepository, this._appPreferencesRepository);

  String get currentLanguage => _locale == null ? '' : _locale.languageCode;

  Locale get locale => _locale;

  /// Return the translation that corresponds to the [key]
  /// The [key] might be a sequence of [key].[sub-key].[sub-key]
  String translate(String key) {
    // Return the requested string
    String translation = key;

    if (_localizedValues != null) {
      // Check if the requested [key] is in the cache
      if (_cache[key] != null) {
        return _cache[key];
      }

      // Iterate the key until found or not
      bool found = true;
      Map<dynamic, dynamic> _values = _localizedValues;
      final List<String> _keyParts = key.split('.');
      final int _keyPartsLen = _keyParts.length;
      int index = 0;
      final int lastIndex = _keyPartsLen - 1;

      while (index < _keyPartsLen && found) {
        final value = _values[_keyParts[index]];

        if (value == null) {
          // Not found => STOP
          found = false;
          break;
        }

        // Check if we found the requested key
        if (value is String && index == lastIndex) {
          translation = value;

          // Add to cache
          _cache[key] = translation;
          break;
        }

        // go to next subKey
        _values = value as Map;
        index++;
      }
    }
    return translation;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<Failure> init(bool useDefaultLocale) async {
    if (useDefaultLocale) {
      log.fine("Using default locale for init");
      return changeLanguage(supportedLanguages.keys.first);
    }
    log.fine("Loading stored locale");
    return _appPreferencesRepository.getValue(preference: AppPreferences.keyLocale, type: String).fold((Object locale) {
      return changeLanguage(locale as String);
    }, (Failure f) {
      log.severe("Error while loading stored locale $f");
      return changeLanguage(supportedLanguages.keys.first);
    });
  }

  /// Routine to change the language
  Future<Failure> changeLanguage(String language) async {
    // Check if we are supporting the language
    if (!supportedLanguages.keys.contains(language)) {
      return Future.value(UnsupportedValueFailure());
    }

    // Set the Locale
    final Locale tempLocale = Locale(language);

    // Load the language strings
    return (await _translationFileRepository.loadJsonFile(tempLocale)).fold((Map map) {
      //set locale
      _localizedValues = map;
      _locale = tempLocale;
      // Clear the cache
      _cache = {};
      return Future.value(null);
    }, (Failure f) {
      return Future.value(f);
    });
  }
}
