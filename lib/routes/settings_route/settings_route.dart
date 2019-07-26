import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import 'settings_route_localizations.dart';
import '../../models/settings_model.dart';

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
          Consumer<SettingsModel>(builder: (context, settingsModel, child) =>
            ListTile(
              title: Text(localizations.settingsRoute.darkTheme, style: _titleStyle),
              trailing: Switch(value: settingsModel.isDarkThemeEnabled, onChanged: settingsModel.toggleDarkTheme),
            )
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