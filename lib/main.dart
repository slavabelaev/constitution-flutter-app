import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'models/favorites_model.dart';
import 'models/settings_model.dart';
import 'l10n/app_localizations.dart';
import 'package:constitution/routes/home_route/home_route.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => FavoritesModel()),
          ChangeNotifierProvider(builder: (context) => SettingsModel()),
        ],
        child: App()
    )
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  initState() {
    super.initState();
  }

  ThemeData get _lightTheme {
    ThemeData _theme = ThemeData.light();
    return _theme.copyWith(
        primaryColor: Colors.grey[900],
        cardTheme: _theme.cardTheme.copyWith(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        primaryTextTheme: _theme.primaryTextTheme.copyWith(
            headline: _theme.primaryTextTheme.headline.copyWith(
                //color: Colors.grey[900]
            )
        ),
        textTheme: TextTheme(
            body1: _theme.textTheme.body1.copyWith(
              fontSize: 16.0,
              height: 1.5
            ),
            title: _theme.textTheme.title.copyWith(
              fontSize: 18.0,
              height: 1.25
            ),
            subtitle: _theme.textTheme.subtitle.copyWith(
              height: 1.5,
              fontSize: 16.0,
              color: Colors.grey[700]
            )
        )
    );
  }

  ThemeData get _darkTheme {
    ThemeData _theme = ThemeData.dark();
    Color white87 = Color.fromRGBO(255, 255, 255, .87);
    return _theme.copyWith(
        primaryColor: Colors.grey[900],
        cardColor: _theme.primaryColor,
        cardTheme: _theme.cardTheme.copyWith(
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        scaffoldBackgroundColor: Colors.black87,
        canvasColor: Colors.grey[900],
        dialogTheme: _theme.dialogTheme.copyWith(
          backgroundColor: Colors.grey[900]
        ),
        iconTheme: _theme.iconTheme.copyWith(
          color: white87
        ),
        primaryTextTheme: _theme.primaryTextTheme.copyWith(
          headline: _theme.primaryTextTheme.headline.copyWith(
            color: Colors.grey[900]
          )
        ),
        textTheme: TextTheme(
            body1: _theme.textTheme.body1.copyWith(
              fontSize: 16.0,
              height: 1.5,
              color: white87
            ),
            title: _theme.textTheme.title.copyWith(
                fontSize: 18.0,
                height: 1.25,
                color: white87
            ),
            subtitle: _theme.textTheme.subtitle.copyWith(
                height: 1.5,
                fontSize: 16.0,
                color: white87
            )
        )
    );
  }

  AppLocalizations getLocalizations(context, Locale locale) {
    return (locale != null) ? AppLocalizations(locale) : AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModel>(
      builder: (context, settings, child) {

        if (!settings.loaded) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return MaterialApp(
            theme: settings.isDarkThemeEnabled ? _darkTheme : _lightTheme,
            darkTheme: _darkTheme,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('ru'),
              const Locale('md'),
              const Locale('uk'),
            ],
            home: HomeRoute()//HomeRoute()
        );
      }
    );
  }
}