// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'events_app_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppPreferenceBlocEventTearOff {
  const _$AppPreferenceBlocEventTearOff();

  PreferenceChangeEvent update(
      {@required String preference, @required Object value}) {
    return PreferenceChangeEvent(
      preference: preference,
      value: value,
    );
  }
}

// ignore: unused_element
const $AppPreferenceBlocEvent = _$AppPreferenceBlocEventTearOff();

mixin _$AppPreferenceBlocEvent {
  String get preference;
  Object get value;

  $AppPreferenceBlocEventCopyWith<AppPreferenceBlocEvent> get copyWith;
}

abstract class $AppPreferenceBlocEventCopyWith<$Res> {
  factory $AppPreferenceBlocEventCopyWith(AppPreferenceBlocEvent value,
          $Res Function(AppPreferenceBlocEvent) then) =
      _$AppPreferenceBlocEventCopyWithImpl<$Res>;
  $Res call({String preference, Object value});
}

class _$AppPreferenceBlocEventCopyWithImpl<$Res>
    implements $AppPreferenceBlocEventCopyWith<$Res> {
  _$AppPreferenceBlocEventCopyWithImpl(this._value, this._then);

  final AppPreferenceBlocEvent _value;
  // ignore: unused_field
  final $Res Function(AppPreferenceBlocEvent) _then;

  @override
  $Res call({
    Object preference = freezed,
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      preference:
          preference == freezed ? _value.preference : preference as String,
      value: value == freezed ? _value.value : value,
    ));
  }
}

abstract class $PreferenceChangeEventCopyWith<$Res>
    implements $AppPreferenceBlocEventCopyWith<$Res> {
  factory $PreferenceChangeEventCopyWith(PreferenceChangeEvent value,
          $Res Function(PreferenceChangeEvent) then) =
      _$PreferenceChangeEventCopyWithImpl<$Res>;
  @override
  $Res call({String preference, Object value});
}

class _$PreferenceChangeEventCopyWithImpl<$Res>
    extends _$AppPreferenceBlocEventCopyWithImpl<$Res>
    implements $PreferenceChangeEventCopyWith<$Res> {
  _$PreferenceChangeEventCopyWithImpl(
      PreferenceChangeEvent _value, $Res Function(PreferenceChangeEvent) _then)
      : super(_value, (v) => _then(v as PreferenceChangeEvent));

  @override
  PreferenceChangeEvent get _value => super._value as PreferenceChangeEvent;

  @override
  $Res call({
    Object preference = freezed,
    Object value = freezed,
  }) {
    return _then(PreferenceChangeEvent(
      preference:
          preference == freezed ? _value.preference : preference as String,
      value: value == freezed ? _value.value : value,
    ));
  }
}

class _$PreferenceChangeEvent
    with DiagnosticableTreeMixin
    implements PreferenceChangeEvent {
  const _$PreferenceChangeEvent(
      {@required this.preference, @required this.value})
      : assert(preference != null),
        assert(value != null);

  @override
  final String preference;
  @override
  final Object value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPreferenceBlocEvent.update(preference: $preference, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppPreferenceBlocEvent.update'))
      ..add(DiagnosticsProperty('preference', preference))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PreferenceChangeEvent &&
            (identical(other.preference, preference) ||
                const DeepCollectionEquality()
                    .equals(other.preference, preference)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(preference) ^
      const DeepCollectionEquality().hash(value);

  @override
  $PreferenceChangeEventCopyWith<PreferenceChangeEvent> get copyWith =>
      _$PreferenceChangeEventCopyWithImpl<PreferenceChangeEvent>(
          this, _$identity);
}

abstract class PreferenceChangeEvent implements AppPreferenceBlocEvent {
  const factory PreferenceChangeEvent(
      {@required String preference,
      @required Object value}) = _$PreferenceChangeEvent;

  @override
  String get preference;
  @override
  Object get value;
  @override
  $PreferenceChangeEventCopyWith<PreferenceChangeEvent> get copyWith;
}
