import 'package:flutter/material.dart';
import '../../../../core/i18n/translations.dart';
import 'settings_page.dart';


class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0, bottom: 10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Center(
              child: Text(translate("home.title.page")),
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Text(translate("settings.title.page"))),
          ]),
        ),
      ),
    );
  }
}
