// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'states_app_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppPreferencesBlocStateTearOff {
  const _$AppPreferencesBlocStateTearOff();

  _LoadedState loaded(AppPreferences appPreferences) {
    return _LoadedState(
      appPreferences,
    );
  }

  _ErrorState error(AppPreferences appPreferences, Failure failure) {
    return _ErrorState(
      appPreferences,
      failure,
    );
  }
}

// ignore: unused_element
const $AppPreferencesBlocState = _$AppPreferencesBlocStateTearOff();

mixin _$AppPreferencesBlocState {
  AppPreferences get appPreferences;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(AppPreferences appPreferences),
    @required Result error(AppPreferences appPreferences, Failure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(AppPreferences appPreferences),
    Result error(AppPreferences appPreferences, Failure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(_LoadedState value),
    @required Result error(_ErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(_LoadedState value),
    Result error(_ErrorState value),
    @required Result orElse(),
  });

  $AppPreferencesBlocStateCopyWith<AppPreferencesBlocState> get copyWith;
}

abstract class $AppPreferencesBlocStateCopyWith<$Res> {
  factory $AppPreferencesBlocStateCopyWith(AppPreferencesBlocState value,
          $Res Function(AppPreferencesBlocState) then) =
      _$AppPreferencesBlocStateCopyWithImpl<$Res>;
  $Res call({AppPreferences appPreferences});
}

class _$AppPreferencesBlocStateCopyWithImpl<$Res>
    implements $AppPreferencesBlocStateCopyWith<$Res> {
  _$AppPreferencesBlocStateCopyWithImpl(this._value, this._then);

  final AppPreferencesBlocState _value;
  // ignore: unused_field
  final $Res Function(AppPreferencesBlocState) _then;

  @override
  $Res call({
    Object appPreferences = freezed,
  }) {
    return _then(_value.copyWith(
      appPreferences: appPreferences == freezed
          ? _value.appPreferences
          : appPreferences as AppPreferences,
    ));
  }
}

abstract class _$LoadedStateCopyWith<$Res>
    implements $AppPreferencesBlocStateCopyWith<$Res> {
  factory _$LoadedStateCopyWith(
          _LoadedState value, $Res Function(_LoadedState) then) =
      __$LoadedStateCopyWithImpl<$Res>;
  @override
  $Res call({AppPreferences appPreferences});
}

class __$LoadedStateCopyWithImpl<$Res>
    extends _$AppPreferencesBlocStateCopyWithImpl<$Res>
    implements _$LoadedStateCopyWith<$Res> {
  __$LoadedStateCopyWithImpl(
      _LoadedState _value, $Res Function(_LoadedState) _then)
      : super(_value, (v) => _then(v as _LoadedState));

  @override
  _LoadedState get _value => super._value as _LoadedState;

  @override
  $Res call({
    Object appPreferences = freezed,
  }) {
    return _then(_LoadedState(
      appPreferences == freezed
          ? _value.appPreferences
          : appPreferences as AppPreferences,
    ));
  }
}

class _$_LoadedState with DiagnosticableTreeMixin implements _LoadedState {
  const _$_LoadedState(this.appPreferences) : assert(appPreferences != null);

  @override
  final AppPreferences appPreferences;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPreferencesBlocState.loaded(appPreferences: $appPreferences)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppPreferencesBlocState.loaded'))
      ..add(DiagnosticsProperty('appPreferences', appPreferences));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadedState &&
            (identical(other.appPreferences, appPreferences) ||
                const DeepCollectionEquality()
                    .equals(other.appPreferences, appPreferences)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appPreferences);

  @override
  _$LoadedStateCopyWith<_LoadedState> get copyWith =>
      __$LoadedStateCopyWithImpl<_LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(AppPreferences appPreferences),
    @required Result error(AppPreferences appPreferences, Failure failure),
  }) {
    assert(loaded != null);
    assert(error != null);
    return loaded(appPreferences);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(AppPreferences appPreferences),
    Result error(AppPreferences appPreferences, Failure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(appPreferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(_LoadedState value),
    @required Result error(_ErrorState value),
  }) {
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(_LoadedState value),
    Result error(_ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements AppPreferencesBlocState {
  const factory _LoadedState(AppPreferences appPreferences) = _$_LoadedState;

  @override
  AppPreferences get appPreferences;
  @override
  _$LoadedStateCopyWith<_LoadedState> get copyWith;
}

abstract class _$ErrorStateCopyWith<$Res>
    implements $AppPreferencesBlocStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(
          _ErrorState value, $Res Function(_ErrorState) then) =
      __$ErrorStateCopyWithImpl<$Res>;
  @override
  $Res call({AppPreferences appPreferences, Failure failure});
}

class __$ErrorStateCopyWithImpl<$Res>
    extends _$AppPreferencesBlocStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(
      _ErrorState _value, $Res Function(_ErrorState) _then)
      : super(_value, (v) => _then(v as _ErrorState));

  @override
  _ErrorState get _value => super._value as _ErrorState;

  @override
  $Res call({
    Object appPreferences = freezed,
    Object failure = freezed,
  }) {
    return _then(_ErrorState(
      appPreferences == freezed
          ? _value.appPreferences
          : appPreferences as AppPreferences,
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

class _$_ErrorState with DiagnosticableTreeMixin implements _ErrorState {
  const _$_ErrorState(this.appPreferences, this.failure)
      : assert(appPreferences != null),
        assert(failure != null);

  @override
  final AppPreferences appPreferences;
  @override
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPreferencesBlocState.error(appPreferences: $appPreferences, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppPreferencesBlocState.error'))
      ..add(DiagnosticsProperty('appPreferences', appPreferences))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorState &&
            (identical(other.appPreferences, appPreferences) ||
                const DeepCollectionEquality()
                    .equals(other.appPreferences, appPreferences)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appPreferences) ^
      const DeepCollectionEquality().hash(failure);

  @override
  _$ErrorStateCopyWith<_ErrorState> get copyWith =>
      __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(AppPreferences appPreferences),
    @required Result error(AppPreferences appPreferences, Failure failure),
  }) {
    assert(loaded != null);
    assert(error != null);
    return error(appPreferences, failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(AppPreferences appPreferences),
    Result error(AppPreferences appPreferences, Failure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(appPreferences, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(_LoadedState value),
    @required Result error(_ErrorState value),
  }) {
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(_LoadedState value),
    Result error(_ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements AppPreferencesBlocState {
  const factory _ErrorState(AppPreferences appPreferences, Failure failure) =
      _$_ErrorState;

  @override
  AppPreferences get appPreferences;
  Failure get failure;
  @override
  _$ErrorStateCopyWith<_ErrorState> get copyWith;
}
