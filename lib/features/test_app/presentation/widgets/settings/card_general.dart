import 'package:flutter/material.dart';
import '../../../../../core/i18n/translations.dart';
import '../../../../../features/application_preferences/domain/entities/app_preferences.dart';
import '../../../../../features/application_preferences/presentation/widgets/language_picker.dart';
import '../../../../../features/application_preferences/presentation/widgets/ui_theme_picker.dart';
import '../../../../../features/application_preferences/presentation/widgets/unit_system_picker.dart';
import 'settings_divider.dart';

class CardGeneral extends StatelessWidget {
  final AppPreferences _appPreferences;

  static const textFlex = 6;
  static const valueFlex = 4;
  static const divider = SettingsDivider();

  const CardGeneral(this._appPreferences);

  @override
  Widget build(BuildContext context) {
    const double cardMarginValue = 32.0;

    return Card(
        margin: const EdgeInsets.only(bottom: cardMarginValue, top: cardMarginValue),
        child: Column(
          children: <Widget>[
            Text(
              translate("settings.title.general"),
              style: Theme.of(context).textTheme.title,
            ),
            _createRow(Icon(Icons.translate), translate("settings.text.general.language"), LanguagePicker(_appPreferences.locale)),
            divider,
            _createRow(Icon(Icons.color_lens), translate("settings.text.general.theme"), UiThemePicker(_appPreferences.appTheme)),
            divider,
            _createRow(Icon(Icons.party_mode), translate("settings.text.general.unit_system"), UnitSystemPicker(_appPreferences.unitSystem)),
          ],
        ));
  }

  Widget _createRow(Icon icon, String text, Widget element) {
    final titleRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(text),
        element
      ],
    );
    return ListTile(leading: icon, title: titleRow);
  }
}
