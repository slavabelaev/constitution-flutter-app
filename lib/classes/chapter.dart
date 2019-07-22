import 'package:flutter/foundation.dart';

class Chapter {
  final num number;
  final String title;
  final num startsWith;
  final num endsWith;

  Chapter({
    @required this.number,
    @required this.title,
    @required this.startsWith,
    @required this.endsWith
  });
}