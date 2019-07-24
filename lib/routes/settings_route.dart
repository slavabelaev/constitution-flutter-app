import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class SettingsRoute extends StatelessWidget {

  SettingsRouteLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context).settingsRoute;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(localizations.darkTheme),
            trailing: Switch(value: true, onChanged: null),
          ),
          ListTile(
            title: Text(localizations.fontSize),
            trailing: Switch(value: true, onChanged: null),
          ),
        ],
      ),
    );
  }
}