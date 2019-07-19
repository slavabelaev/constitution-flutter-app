import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      children:
      items.map((item) => Container(
        child: Text('${item.name}) ${item.text}'),
        margin:  EdgeInsets.only(bottom: (item != items.last) ? 16.0 : 0),
      )).toList(),
    );
  }

  Widget buildParagraphs(List<Paragraph> items) {
    return Container(
      child: Column(
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
                        if (item.introduction != null) Text(item.introduction),
                      ],
                    ),
                    if (item.subParagraphs != null)
                      buildSubParagraphs(item.subParagraphs),
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
                onPressed: () => null
              ),
              Consumer<AppModel>(
                builder: (context, appModel, child) => IconButton(
                    icon:
                    Icon(appModel.containsInFavorites(article) ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      appModel.toggleFavorite(article);
                      toggleCheck(article);
                    }),
              )
            ],
          ),
          if (article.text != null) Container(
            child: Text(
              article.text,
              style: Theme.of(context).textTheme.body1
            ),
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          ),
          if (article.paragraphs != null) buildParagraphs(article.paragraphs)
        ],
      ),
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