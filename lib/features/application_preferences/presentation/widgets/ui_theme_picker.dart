import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../../../core/i18n/translations.dart';
import '../../domain/entities/app_preferences.dart';
import '../bloc/bloc.dart';

class UiThemePicker extends StatelessWidget {
  final String value;

  const UiThemePicker(this.value);

  @override
  Widget build(BuildContext context) {
    return SearchableDropdown.single(
      items: appThemes.map<DropdownMenuItem<String>>((f) => DropdownMenuItem<String>(value:f, child: Text(translate("settings.text.general.theme_$f"))) ).toList(),
      value: value,
      underline: Container(),
      displayClearIcon: false,
      searchHint: translate("settings.hint.search.theme"),
        onChanged: (value) {
          BlocProvider.of<AppPreferencesBloc>(context).add(PreferenceChangeEvent(preference: AppPreferences.keyAppTheme, value: value));
        },
          );
  }
}
