import 'sub_paragraph.dart';

class Paragraph {
  final num number;
  final List<String> introduction;
  final List<String> conclusion;
  final List<SubParagraph> subParagraphs;

  Paragraph(
      {this.number,
        this.introduction,
        this.conclusion,
        this.subParagraphs});
}