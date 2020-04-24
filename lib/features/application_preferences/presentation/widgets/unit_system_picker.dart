import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/i18n/translations.dart';
import '../../domain/entities/app_preferences.dart';
import '../bloc/bloc.dart';

class UnitSystemPicker extends StatelessWidget {
  final String value;

  const UnitSystemPicker(this.value);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: value,
        underline: Container(),
        onChanged: (value) {
          BlocProvider.of<AppPreferencesBloc>(context).add(PreferenceChangeEvent(preference: AppPreferences.keyUnitSystem, value: value));
        },
        items: unitSystems.map<DropdownMenuItem<String>>((f) => DropdownMenuItem<String>(value:f, child: Text(translate("settings.text.general.unit_system_$f"))) ).toList(),
    );
  }
}
