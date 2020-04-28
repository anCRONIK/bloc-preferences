import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/i18n/translations.dart';
import '../../../../features/application_preferences/domain/entities/app_preferences.dart';
import '../../../../features/application_preferences/presentation/bloc/bloc.dart';
import '../widgets/settings/card_general.dart';

/// Page for displaying application settings to the user.
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return BlocConsumer<AppPreferencesBloc, AppPreferencesBlocState>(
        bloc: BlocProvider.of<AppPreferencesBloc>(context),
        listenWhen: (previous, current){
          return current.when(loaded: (val)=> false, error: (val)=> true);
        },
        listener: (context, state){
          showErrorDialog(context, (state as ErrorState).failure);
        },
        buildWhen: (previousState, state){
          return state.map(loaded: (val)=> true, error: (f)=> false);
        },
        builder: (context, state){
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

  //TODO
  void showErrorDialog(BuildContext context, Failure f){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("!!"),
          content: Text(translate(failureToMessage(f))),
        );
      },
    );
  }
