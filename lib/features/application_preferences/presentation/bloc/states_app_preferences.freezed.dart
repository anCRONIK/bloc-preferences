// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'states_app_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppPreferencesBlocStateTearOff {
  const _$AppPreferencesBlocStateTearOff();

  LoadedState loaded(AppPreferences appPreferences) {
    return LoadedState(
      appPreferences,
    );
  }

  ErrorState error(Failure failure) {
    return ErrorState(
      failure,
    );
  }
}

// ignore: unused_element
const $AppPreferencesBlocState = _$AppPreferencesBlocStateTearOff();

mixin _$AppPreferencesBlocState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(AppPreferences appPreferences),
    @required Result error(Failure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(AppPreferences appPreferences),
    Result error(Failure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(LoadedState value),
    @required Result error(ErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(LoadedState value),
    Result error(ErrorState value),
    @required Result orElse(),
  });
}

abstract class $AppPreferencesBlocStateCopyWith<$Res> {
  factory $AppPreferencesBlocStateCopyWith(AppPreferencesBlocState value,
          $Res Function(AppPreferencesBlocState) then) =
      _$AppPreferencesBlocStateCopyWithImpl<$Res>;
}

class _$AppPreferencesBlocStateCopyWithImpl<$Res>
    implements $AppPreferencesBlocStateCopyWith<$Res> {
  _$AppPreferencesBlocStateCopyWithImpl(this._value, this._then);

  final AppPreferencesBlocState _value;
  // ignore: unused_field
  final $Res Function(AppPreferencesBlocState) _then;
}

abstract class $LoadedStateCopyWith<$Res> {
  factory $LoadedStateCopyWith(
          LoadedState value, $Res Function(LoadedState) then) =
      _$LoadedStateCopyWithImpl<$Res>;
  $Res call({AppPreferences appPreferences});
}

class _$LoadedStateCopyWithImpl<$Res>
    extends _$AppPreferencesBlocStateCopyWithImpl<$Res>
    implements $LoadedStateCopyWith<$Res> {
  _$LoadedStateCopyWithImpl(
      LoadedState _value, $Res Function(LoadedState) _then)
      : super(_value, (v) => _then(v as LoadedState));

  @override
  LoadedState get _value => super._value as LoadedState;

  @override
  $Res call({
    Object appPreferences = freezed,
  }) {
    return _then(LoadedState(
      appPreferences == freezed
          ? _value.appPreferences
          : appPreferences as AppPreferences,
    ));
  }
}

class _$LoadedState with DiagnosticableTreeMixin implements LoadedState {
  const _$LoadedState(this.appPreferences) : assert(appPreferences != null);

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
        (other is LoadedState &&
            (identical(other.appPreferences, appPreferences) ||
                const DeepCollectionEquality()
                    .equals(other.appPreferences, appPreferences)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appPreferences);

  @override
  $LoadedStateCopyWith<LoadedState> get copyWith =>
      _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(AppPreferences appPreferences),
    @required Result error(Failure failure),
  }) {
    assert(loaded != null);
    assert(error != null);
    return loaded(appPreferences);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(AppPreferences appPreferences),
    Result error(Failure failure),
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
    @required Result loaded(LoadedState value),
    @required Result error(ErrorState value),
  }) {
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(LoadedState value),
    Result error(ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements AppPreferencesBlocState {
  const factory LoadedState(AppPreferences appPreferences) = _$LoadedState;

  AppPreferences get appPreferences;
  $LoadedStateCopyWith<LoadedState> get copyWith;
}

abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

class _$ErrorStateCopyWithImpl<$Res>
    extends _$AppPreferencesBlocStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(ErrorState _value, $Res Function(ErrorState) _then)
      : super(_value, (v) => _then(v as ErrorState));

  @override
  ErrorState get _value => super._value as ErrorState;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(ErrorState(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

class _$ErrorState with DiagnosticableTreeMixin implements ErrorState {
  const _$ErrorState(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPreferencesBlocState.error(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppPreferencesBlocState.error'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loaded(AppPreferences appPreferences),
    @required Result error(Failure failure),
  }) {
    assert(loaded != null);
    assert(error != null);
    return error(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loaded(AppPreferences appPreferences),
    Result error(Failure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loaded(LoadedState value),
    @required Result error(ErrorState value),
  }) {
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loaded(LoadedState value),
    Result error(ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements AppPreferencesBlocState {
  const factory ErrorState(Failure failure) = _$ErrorState;

  Failure get failure;
  $ErrorStateCopyWith<ErrorState> get copyWith;
}
