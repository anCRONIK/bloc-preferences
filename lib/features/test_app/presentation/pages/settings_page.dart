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
    final bloc = BlocProvider.of<AppPreferencesBloc>(context);
    return StreamBuilder(
      stream: bloc,
      initialData: bloc.state,
      builder: (context, snap) {
        //TODO do we need to handle snap states?
        final appPreferences = (snap.data as AppPreferencesBlocState).appPreferences;
        return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[CardGeneral(appPreferences)],
              ),
            ));
      },
    );
  }
}

