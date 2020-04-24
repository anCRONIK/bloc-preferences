import 'package:flutter/material.dart';

class SettingsDivider extends StatelessWidget {

  const SettingsDivider();

  @override
  Widget build(BuildContext context){
    return Container(width: double.infinity, height: 0.4, color: Theme.of(context).dividerColor,);
  }
}
