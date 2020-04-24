import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../features/application_preferences/domain/entities/app_preferences.dart';
import '../../../../features/application_preferences/presentation/bloc/bloc.dart';
import '../widgets/settings/card_general.dart';

/// Page for displaying application settings to the user.
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPreferencesBloc, AppPreferencesBlocState>(builder: (BuildContext context, AppPreferencesBlocState blocState) {
      return blocState.when(
          loaded: (AppPreferences appPreferences) => _buildListView(appPreferences),
          error: (AppPreferences appPreferences, Failure failure) {
           //TODO show some error dialog
            return _buildListView(appPreferences);
          });
    });
  }
}

Widget _buildListView(AppPreferences appPreferences) {
  return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[CardGeneral(appPreferences)],
        ),
      ));
}
