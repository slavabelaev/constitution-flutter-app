import 'package:flutter/foundation.dart';
import 'chapter.dart';

class Section {
  final String name;
  final String title;
  final num startsWith;
  final num endsWith;
  final List<Chapter> chapters;

  Section({
    @required this.name,
    @required this.title,
    @required this.startsWith,
    @required this.endsWith,
    this.chapters
  });
}