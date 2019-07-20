import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../models/app_model.dart';
import '../classes/article.dart';
import '../classes/paragraph.dart';
import '../classes/sub_paragraph.dart';

class ArticleCard extends StatefulWidget {
  ArticleCard(this.article);

  final Article article;

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool checked = false;

  void toggleCheck(Article article) {
    setState(() => checked = !checked);
  }

  Widget buildSubParagraphs(List<SubParagraph> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      items.map((item) => Container(
        child: Text.rich(TextSpan(
          children: [
            TextSpan(
              text: '${item.name}) ',
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            TextSpan(text: '${item.text}')
          ]
        )),
        margin:  EdgeInsets.only(bottom: (item != items.last) ? 16.0 : 0),
      )).toList(),
    );
  }

  Widget buildParagraphs(List<Paragraph> items) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomDivider(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Пункт ${item.name}',
                            style: TextStyle(
                                fontSize: 18.0,
                                height: 1,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          margin: const EdgeInsets.only(bottom: 16.0),
                        ),
                        if (item.introduction != null)
                          buildText(item.introduction),
                      ],
                    ),
                    if (item.subParagraphs != null)
                      buildSubParagraphs(item.subParagraphs),
                    if (item.conclusion != null)
                      buildText(item.conclusion)
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
              )
            ],
          )
        ).toList(),
      )
    );
  }

  String _getArticleAsPlainText(Article article) {
    String lineBreak = '\r\n\r\n';
    String articleText = 'СТАТЬЯ ${article.number}' + lineBreak;

    if (article.text != null) articleText += '${article.text}' + lineBreak;

    if (article.paragraphs != null) {
      article.paragraphs.forEach((paragraph) {
        if (paragraph.name != null) articleText += 'Пункт ${paragraph.name}'.toUpperCase() + lineBreak;
        if (paragraph.introduction != null) articleText += paragraph.introduction + lineBreak;
        if (paragraph.subParagraphs != null) {
          paragraph.subParagraphs.forEach((subParagraph) {
            articleText += '${subParagraph.name}) ${subParagraph.text}' + lineBreak;
          });
        }

        if (paragraph.conclusion != null) articleText += paragraph.conclusion + lineBreak;

      });
    }

    return articleText;
  }

  void _shareArticle(Article article) {
    String articleText = _getArticleAsPlainText(article);
    Share.share(
      articleText,
      subject: 'Статья ${article.number}'
    );
  }

  @override
  Widget build(BuildContext context) {
    Article article = widget.article;

    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                      'Статья ${article.number}',
                      style: Theme.of(context).textTheme.title
                  ),
                  padding: const EdgeInsets.all(16.0),
                )
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () => _shareArticle(article)
              ),
              Consumer<AppModel>(
                builder: (context, appModel, child) => IconButton(
                    icon:
                    Icon(appModel.containsInFavorites(article) ? Icons.bookmark : Icons.bookmark_border),
                    onPressed: () {
                      appModel.toggleFavorite(article);
                      toggleCheck(article);
                    }),
              )
            ],
          ),
          if (article.text != null) Container(
            child: buildText(article.text),
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          ),
          if (article.paragraphs != null) buildParagraphs(article.paragraphs)
        ],
      ),
    );
  }

  Widget buildText(String text) {
    List<String> textElements = text.split('\r\n\r\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textElements.map(
        (text) => Container(
          child: Text(text, style: Theme.of(context).textTheme.body1),
          margin: EdgeInsets.only(bottom: text != textElements.last ? 16.0 : 0),
        )
      ).toList()
    );
  }
}

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 1,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}