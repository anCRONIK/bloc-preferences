import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../../../../core/i18n/translations.dart';
import '../../domain/entities/app_preferences.dart';
import '../bloc/bloc.dart';

class LanguagePicker extends StatelessWidget {
  final String value;

  const LanguagePicker(this.value);

  @override
  Widget build(BuildContext context){
    final List<DropdownMenuItem> data = [];
    supportedLanguages.forEach((String key, String value){
      data.add(DropdownMenuItem(value: key, child: Text(value),));
    });
    return SearchableDropdown.single(
      items: data,
      value: value,
      displayClearIcon: false,
      underline: Container(),
      searchHint: translate("settings.hint.search.language"),
      onChanged: (value){
        BlocProvider.of<AppPreferencesBloc>(context).add(PreferenceChangeEvent(preference: AppPreferences.keyLocale, value: value));
      },
     // isExpanded: true,
    );
  }

}
