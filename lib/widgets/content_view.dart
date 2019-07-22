import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/article.dart';
import '../classes/section.dart';
import '../classes/chapter.dart';
import '../models/app_model.dart';
import '../routes/article_list_route.dart';
import '../routes/preable_route.dart';

class ContentView extends StatelessWidget {
  ContentView(this.content);

  final List<Section> content;
  final TextStyle _titleStyle = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 0.87),
      height: 1.25,
      fontWeight: FontWeight.w500
  );
  final TextStyle _leadingStyle = TextStyle(
      fontWeight: FontWeight.w500
  );

  void _showArticles(
      BuildContext context,
      String title,
      String sectionName,
      num startsWith,
      num endsWith
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
          Consumer<AppModel>(builder: (context, app, child) {
            List<Article> sectionArticles = app.articles.where(
              (article) => (
                  article.section == sectionName &&
                  article.number >= startsWith &&
                  article.number <= endsWith
              )
            ).toList();
            return ArticleListRoute(
                sectionArticles,
                title: title
            );
          }
        )
      )
    );
  }

  void _showPreamble(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
          Consumer<AppModel>(
            builder: (context, app, child) => PreambleRoute(
              app.preamble,
              title: title,
            )
          )
      )
    );
  }

  Widget _buildSectionListTile(BuildContext context, Section section) {
    bool isPreamble = (section.startsWith == 0);

    Widget _buildSubtitle() {
      return isPreamble ? null : Text('Статьи ${section.startsWith}-${section.endsWith}');
    }

    return ListTile(
      leading: CircleAvatar(
        child: Text(
          section.name,
          style: _leadingStyle
        ),
        backgroundColor: Colors.grey[900],
      ),
      title: Text(
        section.title,
        style: _titleStyle
      ),
      subtitle: _buildSubtitle(),
      onTap: () => isPreamble ?
        _showPreamble(context, section.title) :
        _showArticles(context, section.title, section.name, section.startsWith, section.endsWith),
    );
  }

  Widget _buildChapterListTile(BuildContext context, Section section, Chapter chapter) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        child: Text(
          chapter.number.toString(),
          style: _leadingStyle
        ),
      ),
      title: Text(
        chapter.title,
        style: _titleStyle,
      ),
      subtitle: Text('Статьи ${chapter.startsWith}-${chapter.endsWith}'),
      onTap: () => _showArticles(context, chapter.title, section.name, chapter.startsWith, chapter.endsWith),
    );
  }

  Widget _buildListTileWithChapters(BuildContext context, Section section) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[900],
        child: Text(section.name),
      ),
      title: Text(
        section.title,
        style: _titleStyle
      ),
      children: section.chapters.map(
          (chapter) => _buildChapterListTile(context, section, chapter)
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      Padding(padding: const EdgeInsets.all(8.0)),
    ];

    content.forEach((section) {
      Widget _widget = (section.chapters != null) ?
        _buildListTileWithChapters(context, section) :
        _buildSectionListTile(context, section);
      _children.add(_widget);
    });

    return ListView(
      children: _children,
    );
  }
}