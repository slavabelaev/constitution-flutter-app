import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content/articles_ru.dart';
import 'models/app_model.dart';
import 'widgets/home.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        Provider(builder: (context) => AppModel(articles))
      ],
      child: App(),
    )
);

class App extends StatelessWidget {

  ThemeData theme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    accentColor: Colors.white,

    // Define the default font family.
    fontFamily: 'Montserrat',

    backgroundColor: Colors.black,
    bottomAppBarColor: Colors.grey[900],

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 20.0),
      body1: TextStyle(fontSize: 16.0, height: 1.5, fontFamily: 'Hind'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: theme,
      home: Home()
    );
  }
}
