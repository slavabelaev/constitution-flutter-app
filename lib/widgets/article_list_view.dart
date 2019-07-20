import 'package:flutter/material.dart';
import '../classes/article.dart';
import '../widgets/article_card.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView(this.articles, {this.emptyMessage});

  final List<Article> articles;
  String emptyMessage;

  @override
  Widget build(BuildContext context) {
    emptyMessage = emptyMessage != null ? emptyMessage : 'Ничего нет';
    if (articles.length == 0) {
      return Center(
        child: Text(
            emptyMessage,
            style: Theme.of(context).textTheme.title
        ),
      );
    }
      
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) => Padding(
          child: ArticleCard(articles[index]),
          padding: EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
            bottom: (articles[index] == articles.last) ? 8.0 : 0
          )
        )
    );
  }
}