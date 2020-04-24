import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

/// Data source for storing application preferences.
abstract class PreferencesDataSource {
  /// Method for storing given String [object] value with given key [key]. Method will store value or throw exception while writing  features.application_preferences.data. It will return true if
  /// store was successful otherwise false inside [Future].
  /// If [object] is null, this is equivalent the [key].
  Future<bool> storeString(String key, String object);

  /// Method for storing given bool [object] value with given key [key]. Method will store value or throw exception while writing  features.application_preferences.data. It will return true if
  /// store was successful otherwise false inside [Future].
  /// If [object] is null, this is equivalent the [key].
  // ignore: avoid_positional_boolean_parameters
  Future<bool> storeBool(String key, bool object);

  /// Method for storing given number [object] value with given key [key]. Method will store value or throw exception while writing  features.application_preferences.data. It will return true if
  /// store was successful otherwise false inside [Future].
  /// If [object] is null, this is equivalent the [key].
  Future<bool> storeNum(String key, num object);

  /// Method for fetching stored [String] value for given [key].  Method will return stored value or throw exception while reading features.application_preferences.data or if key does not exists.
  String getString(String key);

  /// Method for fetching stored [bool] value for given [key]. Method will return stored value or throw exception while reading features.application_preferences.data or if key does not exists.
  bool getBool(String key);

  /// Method for fetching stored [num] value for given [key]. Method will return stored value or throw exception while reading features.application_preferences.data or if key does not exists.
  num getNum(String key);
}

/// Implementation of [PreferencesDataSource]
@RegisterAs(PreferencesDataSource)
@injectable
class PreferencesDataSourceImpl extends PreferencesDataSource {
  /// SharedPreference instance for use.
  final SharedPreferences _sharedPreferences;

  /// Constructor which takes instance of [SharedPreferences]
  PreferencesDataSourceImpl(this._sharedPreferences);

  /// Logger
  final Logger log = Logger('PreferencesDataSourceImpl');

  @override
  bool getBool(String key) {
    if (!_sharedPreferences.containsKey(key)) {
      throw KeyDoesNotExistsException();
    }
    return _sharedPreferences.getBool(key);
  }

  @override
  num getNum(String key) {
    if (_sharedPreferences.containsKey(key)) {
      try {
        return _sharedPreferences.getInt(key);
      } catch (e) {
        if (e.toString().toLowerCase().contains("_typeerror") || e.toString().toLowerCase().contains("subtype")) {
          log.finer("Not an int value $key");
          return _sharedPreferences.getDouble(key);
        }
        log.severe("Read num error for $key", e);
        throw ReadException();
      }
    } else {
      log.severe("Key $key does not exists");
      throw KeyDoesNotExistsException();
    }
  }

  @override
  String getString(String key) {
    if (!_sharedPreferences.containsKey(key)) {
      throw KeyDoesNotExistsException();
    }
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> storeBool(String key, bool object) {
    return _sharedPreferences.setBool(key, object);
  }

  @override
  Future<bool> storeNum(String key, num object) {
    if (object is int) {
      return _sharedPreferences.setInt(key, object);
    } else if (object is double) {
      return _sharedPreferences.setDouble(key, object);
    } else {
      log.severe("Given num is neither int nor double $key:$object");
      throw WriteException();
    }
  }

  @override
  Future<bool> storeString(String key, String object) {
    return _sharedPreferences.setString(key, object);
  }
}
