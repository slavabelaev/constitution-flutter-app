import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/article.dart';
import '../classes/section.dart';
import '../classes/chapter.dart';
import '../models/app_model.dart';
import '../routes/article_list_route.dart';

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

  void _handleTap(BuildContext context, String title, int from, int to) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
          Consumer<AppModel>(builder: (context, appModel, child) {
            List<Article> sectionArticles = appModel.articles.where(
              (article) => (article.number >= from && article.number <= to)
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

  Widget _buildSectionListTile(BuildContext context, Section section) {
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
      subtitle: Text('Статьи ${section.from}-${section.to}'),
      onTap: () => _handleTap(context, section.title, section.from, section.to),
    );
  }

  Widget _buildChapterListTile(BuildContext context, Chapter chapter) {
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
      subtitle: Text('Статьи ${chapter.from}-${chapter.to}'),
      onTap: () => _handleTap(context, chapter.title, chapter.from, chapter.to),
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
          (chapter) => _buildChapterListTile(context, chapter)
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