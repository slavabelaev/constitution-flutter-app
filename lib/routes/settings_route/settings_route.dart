import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../classes/font_size_factor_option.dart';
import '../../widgets/custom_divider/custom_divider.dart';
import '../../l10n/app_localizations.dart';
import '../../models/settings_model.dart';
import 'settings_route_localizations.dart';


class SettingsRoute extends StatelessWidget {

  AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    TextStyle _titleStyle = Theme.of(context).textTheme.title.copyWith(
      fontSize: 18.0
    );
    TextStyle _dropdownMenuItemStyle = Theme.of(context).textTheme.body1.copyWith(
      fontSize: 18.0
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settingsRoute.title),
      ),
      body:

      Consumer<SettingsModel>(builder: (context, settings, child) =>
        ListView(
          children: <Widget>[
            ListTile(
              title: Text(localizations.settingsRoute.darkTheme, style: _titleStyle),
              trailing: Switch(
                value: settings.isDarkThemeEnabled,
                onChanged: settings.toggleDarkTheme
              ),
            ),
            CustomDivider(),
            ListTile(
              title: Text(localizations.settingsRoute.fontSize, style: _titleStyle),
              trailing: DropdownButton(
                value: settings.fontSizeFactor,
                items: [
                  FontSizeFactorOption(title: 'по умолчанию', value: 1.0),
                  FontSizeFactorOption(title: 'средний', value: 1.125),
                  FontSizeFactorOption(title: 'большой', value: 1.25),
                ]
                  .map((fontSizeFactorOption) =>
                    DropdownMenuItem(
                      child: Text(
                        fontSizeFactorOption.title,
                        style: _dropdownMenuItemStyle,
                      ),
                      value: fontSizeFactorOption.value,
                    )
                  ).toList(),
                onChanged: settings.changeFontSizeFactor
              ),
            ),
            CustomDivider(),
          ],
        ),
      )
    );
  }
}