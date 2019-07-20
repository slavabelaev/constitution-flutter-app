import 'sub_paragraph.dart';

class Paragraph {
  final num number;
  final String introduction;
  final String conclusion;
  final List<SubParagraph> subParagraphs;

  Paragraph(
      {this.number,
        this.introduction,
        this.conclusion,
        this.subParagraphs});
}