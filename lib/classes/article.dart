import 'package:flutter/foundation.dart';
import 'paragraph.dart';
import 'uid.dart';

class Article {
  final Uid uid;
  final num number;
  final String section;
  final num chapter;
  final List<String> introduction;
  final List<String> conclusion;
  final List<Paragraph> paragraphs;

  Article({
    @required this.uid,
    @required this.number,
    @required this.section,
    this.chapter,
    this.introduction,
    this.paragraphs,
    this.conclusion
  });
}
