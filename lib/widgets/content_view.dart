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

  void handleTap(BuildContext context, String title, int from, int to) {
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
                })
        )
    );
  }

  Widget buildSectionListTile(BuildContext context, Section section) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          section.name,
          style: TextStyle(
              fontWeight: FontWeight.w500
          )
        ),
        backgroundColor: Colors.grey[900],
      ),
      title: Text(
        section.title,
        style: TextStyle(
          height: 1.25,
          color: Color.fromRGBO(255, 255, 255, 0.87),
          fontWeight: FontWeight.w500
        )
      ),
      subtitle: Text('Статьи ${section.from}-${section.to}'),
      onTap: () => handleTap(context, section.title, section.from, section.to),
    );
  }

  Widget buildChapterListTile(BuildContext context, Chapter chapter) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        child: Text(
            chapter.number.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500
            )
        ),
      ),
      title: Text(
        chapter.title,
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.87),
          height: 1.25,
          fontWeight: FontWeight.w500
        ),
      ),
      subtitle: Text('Статьи ${chapter.from}-${chapter.to}'),
      onTap: () => handleTap(context, chapter.title, chapter.from, chapter.to),
    );
  }

  Widget buildListTileWithChapters(BuildContext context, Section section) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[900],
        child: Text(section.name),
      ),
      title: Text(
        section.title,
        style: TextStyle(
            height: 1.25,
            color: Color.fromRGBO(255, 255, 255, 0.87),
            fontWeight: FontWeight.w500
        )
      ),
      children: section.chapters.map(
              (chapter) => buildChapterListTile(context, chapter)
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(8.0)),
        ...content.map(
                (section) =>
            (section.chapters != null) ?
            buildListTileWithChapters(context, section) :
            buildSectionListTile(context, section)
        ).toList()
      ],
    );
  }
}