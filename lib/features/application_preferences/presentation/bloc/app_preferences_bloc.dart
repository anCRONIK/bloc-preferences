import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/i18n/translations.dart';
import '../../domain/entities/app_preferences.dart';
import '../../domain/usecases/get_and_store_app_preferences.dart';
import '../util/app_preferences_input_validator.dart';
import 'events_app_preferences.dart';
import 'states_app_preferences.dart';

/// Bloc implementation for application theme
class AppPreferencesBloc extends Bloc<AppPreferenceBlocEvent, AppPreferencesBlocState> {
  final Logger log = Logger('AppPreferencesBloc');

  final GetAndStoreAppPreferences _getStoreAppPreferences;

  final AppPreferencesInputValidator _appPreferencesInputValidator;

  AppPreferencesBloc(this._getStoreAppPreferences, this._appPreferencesInputValidator)
      : assert(_getStoreAppPreferences != null),
        assert(_appPreferencesInputValidator != null);

  @override
  AppPreferencesBlocState get initialState {
    final AppPreferences preferences = _getStoreAppPreferences.getValues();
    return AppPreferencesBlocState.loaded(preferences);
  }

  @override
  Stream<AppPreferencesBlocState> mapEventToState(AppPreferenceBlocEvent event) async* {
    log.fine("Event is $event");
    bool checkLocale = false;
    if (event is PreferenceChangeEvent) {
      final Failure validationFailure = _appPreferencesInputValidator.validate(preference: event.preference, value: event.value);
      if (validationFailure != null) {
        yield AppPreferencesBlocState.error(validationFailure);
      }else{
        final Failure storeFailure = await _getStoreAppPreferences.updateValue(preference: event.preference, value: event.value);
        if (storeFailure != null) {
          yield AppPreferencesBlocState.error(storeFailure);
        } else {
          checkLocale = event.preference == AppPreferences.keyLocale;
          final AppPreferences appPreferences = _getStoreAppPreferences.getValues();
          if (checkLocale == true) {
            await changeLanguage(event.value as String);
          }
        }
      }
    }
    yield* _reloadPreferences();
  }

  /// Method for loading stored application preferences and yielding stream
  Stream<AppPreferencesBlocState> _reloadPreferences() async* {
    final AppPreferences appPreferences = _getStoreAppPreferences.getValues();
    yield AppPreferencesBlocState.loaded(appPreferences);
  }
}
