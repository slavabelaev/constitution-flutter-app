import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'models/favorites_model.dart';
import 'models/locale_model.dart';
import 'l10n/app_localizations.dart';
import 'package:constitution/routes/home_route.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => FavoritesModel()),
          ChangeNotifierProvider(builder: (context) => LocaleModel()),
        ],
        child: App()
    )
  );
}

class App extends StatelessWidget {
  final ThemeData theme = ThemeData.dark().copyWith(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    accentColor: Colors.white,

    // Define the default font family.
    //fontFamily: 'Montserrat',

    backgroundColor: Colors.black,
    bottomAppBarColor: Colors.grey[900],
    canvasColor: Colors.grey[900],

    cardColor: Colors.grey[900],

    scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 0.07),

    iconTheme: IconThemeData().copyWith(
      opacity: .87,
      color: Colors.white
    ),

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 255, 255, 0.87),
      ),
      title: TextStyle(
        fontSize: 20.0,
        color: Color.fromRGBO(255, 255, 255, 0.87)
      ),
      body1: TextStyle(
        fontSize: 16.0,
        height: 1.5,
        //fontFamily: 'Hind',
        color: Color.fromRGBO(255, 255, 255, 0.87)
      ),
    ),
  );

  AppLocalizations getLocalizations(context, Locale locale) {
    return (locale != null) ? AppLocalizations(locale) : AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ru'),
        const Locale('md'),
        const Locale('ua'),
      ],
      home: HomeRoute()//HomeRoute()
    );
  }
}