import 'chapter.dart';

class Section {
  final String name;
  final String title;
  final num from;
  final num to;
  final List<Chapter> chapters;

  Section({this.name, this.title, this.from, this.to, this.chapters});
}