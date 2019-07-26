import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'settings_route_localizations.dart';

class SettingsRoute extends StatelessWidget {

  AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settingsRoute.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(localizations.settingsRoute.darkTheme),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            title: Text(localizations.settingsRoute.fontSize),
            trailing: Switch(value: true, onChanged: null),
          ),
        ],
      ),
    );
  }
}