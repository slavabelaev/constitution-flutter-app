import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content/preamble_ru.dart';
import 'content/articles_ru.dart';
import 'content/content_ru.dart';
import 'content/amendments_ru.dart';
import 'models/app_model.dart';
import 'widgets/home.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        Provider(builder:
          (context) => AppModel(
            preamble: preamble,
            articles: articles,
            content: content,
            amendments: amendments,
          )
        )
      ],
      child: App(),
    )
);

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

    scaffoldBackgroundColor: Color.fromRGBO(18, 18, 18, 1),

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
        color: Colors.white70
      ),
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
