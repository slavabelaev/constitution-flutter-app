import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'settings_route_localizations.dart';

class SettingsRoute extends StatelessWidget {

  AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);

    TextStyle _titleStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settingsRoute.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(localizations.settingsRoute.darkTheme, style: _titleStyle),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            title: Text(localizations.settingsRoute.fontSize, style: _titleStyle),
            trailing: Switch(value: true, onChanged: null),
          ),
        ],
      ),
    );
  }
}