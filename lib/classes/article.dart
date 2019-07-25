import 'package:flutter/foundation.dart';
import 'paragraph.dart';

class Article {
  final num number;
  final String section;
  final num chapter;
  final List<String> introduction;
  final List<String> conclusion;
  final List<Paragraph> paragraphs;

  Article({
    @required this.number,
    @required this.section,
    this.chapter,
    this.introduction,
    this.paragraphs,
    this.conclusion
  });
}
