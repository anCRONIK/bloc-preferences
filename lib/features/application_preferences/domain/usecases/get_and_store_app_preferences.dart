import 'package:either_option/either_option.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import '../../../../core/error/failures.dart';
import '../entities/app_preferences.dart';
import '../repositories/app_preferences_repository.dart';

/// Class for providing methods to read and store application preferences. It depends on the [AppPreferencesRepository] which is used to store and read features.
@lazySingleton
class GetAndStoreAppPreferences {
  /// Our logger
  final Logger log = Logger('GetStoreAppPreferences');

  /// Instance of [AppPreferencesRepository]
  final AppPreferencesRepository _appPreferencesRepository;

  /// Constructor which needs instance of [AppPreferencesRepository] to work with.
  GetAndStoreAppPreferences(this._appPreferencesRepository);

  /// Method for loading store [AppPreferences]. Method returns [Either] containing preferences or some failure.
  AppPreferences getValues() {
    final AppPreferences initial = AppPreferences.initial();
    final Map<String, Object> values = {};
    for (final String key in AppPreferences.supportedKeys) {
      Either<Object, Failure> value;
      switch (key) {
        //here handle booleans and numbers, default is String
        default:
          value = _appPreferencesRepository.getValue(preference: key, type: String);
      }
      value.fold((Object val) {
        values[key] = val;
      }, (Failure f) {
        values[key] = initial.valueForKey(key);
      });
    }
    return AppPreferences.populate(values);
  }

  /// Method for storing values inside given preferences object [data]. In case of some error, method will return [Failure].
  Future<Failure> updateValue({@required String preference, @required Object value}) {
    return _appPreferencesRepository.storeValue(preference: preference, value: value);
  }
}
