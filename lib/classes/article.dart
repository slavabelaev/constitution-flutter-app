import 'paragraph.dart';

class Article {
  final num number;
  final String section;
  final num chapter;
  final List<String> parts;
  final List<Paragraph> paragraphs;

  Article(
      {this.number, this.section, this.chapter, this.parts, this.paragraphs});
}
