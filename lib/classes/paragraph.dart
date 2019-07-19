import 'sub_paragraph.dart';

class Paragraph {
  final num name;
  final String text;
  final String introduction;
  final String conclusion;
  final List<SubParagraph> subParagraphs;

  Paragraph(
      {this.name,
        this.introduction,
        this.conclusion,
        this.text,
        this.subParagraphs});
}