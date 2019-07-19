import 'paragraph.dart';

class Article {
  final num number;
  final String section;
  final num chapter;
  final String text;
  final List<Paragraph> paragraphs;

  Article(
      {this.number, this.section, this.chapter, this.text, this.paragraphs});
}
