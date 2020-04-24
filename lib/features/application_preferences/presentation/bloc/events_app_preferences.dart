import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_app_preferences.freezed.dart';

///Represents states for the BLoC which will handle application preferences
/// Here we need to set all variables that we want to bes saved in application preferences. This is features.application_preferences.data classed which is generated with freezed runner plugin.
@freezed
abstract class AppPreferenceBlocEvent with _$AppPreferenceBlocEvent{
  const factory AppPreferenceBlocEvent.update({@required String preference, @required Object value}) = PreferenceChangeEvent;
}