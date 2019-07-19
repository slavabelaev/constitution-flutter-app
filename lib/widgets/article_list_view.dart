import 'package:flutter/material.dart';
import '../classes/article.dart';
import '../widgets/article_card.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView(this.articles);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    if (articles.length == 0) {
      return Center(
        child: Text('Ничего нет'),
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