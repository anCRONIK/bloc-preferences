import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/application_preferences/domain/entities/app_preferences.dart';
import '../../../../features/application_preferences/presentation/bloc/bloc.dart';
import '../widgets/settings/card_general.dart';

/// Page for displaying application settings to the user.
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPreferencesBloc, AppPreferencesBlocState>(
        bloc: BlocProvider.of<AppPreferencesBloc>(context),
        condition: (previousState, state) {
          return state.map(loaded: (val) => true, error: (f) => false);
        },
        builder: (context, state) {
          return _buildPageContent((state as LoadedState).appPreferences);
        });
  }

  Widget _buildPageContent(AppPreferences appPreferences) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[CardGeneral(appPreferences)],
          ),
        ));
  }
}

