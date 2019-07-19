import 'package:flutter/material.dart';
import '../widgets/article_list_view.dart';
import '../classes/article.dart';

class ArticleListRoute extends StatelessWidget {
  ArticleListRoute(this.articles, {this.title});

  final List<Article> articles;
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ArticleListView(articles),
    );
  }
}