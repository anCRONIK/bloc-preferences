import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/app_preferences.dart';

part 'states_app_preferences.freezed.dart';

/// Represents states for the BLoC which will handle application preferences
/// Here we need to set all variables that we want to bes saved in application preferences. This is features.application_preferences.data classed which is generated with freezed runner plugin.
@freezed
abstract class AppPreferencesBlocState with _$AppPreferencesBlocState {
  const factory AppPreferencesBlocState.loaded(AppPreferences appPreferences) = LoadedState;
  const factory AppPreferencesBlocState.error(Failure failure) = ErrorState;
}