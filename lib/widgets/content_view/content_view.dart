import 'package:flutter/material.dart';
import '../../classes/article.dart';
import '../../classes/section.dart';
import '../../classes/chapter.dart';
import '../../routes/article_list_route/article_list_route.dart';
import '../../routes/preamble_route/preamble_route.dart';
import '../../l10n/app_localizations.dart';
import 'content_view_localizations.dart';

class ContentView extends StatelessWidget {
  ContentView(this.content);

  ContentViewLocalizations localizations;

  final List<Section> content;
  final TextStyle _leadingStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white70
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
        builder: (context) {
          List<Article> sectionArticles = AppLocalizations.of(context).articles.where(
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
    );
  }

  void _showPreamble(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
          PreambleRoute(
            AppLocalizations.of(context).preamble,
            title: title,
          )
      )
    );
  }

  Widget _buildSectionListTile(BuildContext context, Section section) {
    bool isPreamble = (section.startsWith == 0);

    Widget _buildSubtitle() {
      return isPreamble ? null : Text(
        '${localizations.articles} ${section.startsWith}-${section.endsWith}',
        style: Theme.of(context).textTheme.subtitle,
      );
    }

    return ListTile(
      leading: CircleAvatar(
        child: Text(
          section.name,
          style: _leadingStyle
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      title: Text(
        section.title,
        style: Theme.of(context).textTheme.title
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
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(
          chapter.number.toString(),
          style: _leadingStyle
        ),
      ),
      title: Text(
        chapter.title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        '${localizations.articles} ${chapter.startsWith}-${chapter.endsWith}',
        style: Theme.of(context).textTheme.subtitle,
      ),
      onTap: () => _showArticles(context, chapter.title, section.name, chapter.startsWith, chapter.endsWith),
    );
  }

  Widget _buildListTileWithChapters(BuildContext context, Section section) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(
          section.name,
          style: _leadingStyle,
        ),
      ),
      title: Text(
        section.title,
        style: Theme.of(context).textTheme.title
      ),
      children: section.chapters.map(
          (chapter) => _buildChapterListTile(context, section, chapter)
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context).contentView;
    List<Widget> _children = [];

    content.forEach((section) {
      Widget _widget = (section.chapters != null) ?
        _buildListTileWithChapters(context, section) :
        _buildSectionListTile(context, section);
      _children.add(_widget);
    });

    return ListView(
      children: _children,
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    );
  }
}