import 'package:flutter/material.dart';
import '../classes/article.dart';
import '../widgets/article_card.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView(this.articles, {this.emptyMessage, this.controller, this.onItemTap});

  final List<Article> articles;
  final String emptyMessage;
  final ScrollController controller;
  final VoidCallback onItemTap;

  Widget _buildEmptyMessage(BuildContext context) {
    return Center(
      child: Text(
          (emptyMessage != null) ? emptyMessage : 'Ничего нет',
          style: Theme.of(context).textTheme.title
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Padding(
        child: InkWell(
          child: ArticleCard(articles[index]),
          onTap: onItemTap,
        ),
        padding: EdgeInsets.only(
          bottom: (articles[index] == articles.last) ? 0 : 8.0
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (articles == null || articles.length == 0) {
      return _buildEmptyMessage(context);
    }
      
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        controller: (controller != null) ? controller : ScrollController(),
        itemCount: articles.length,
        itemBuilder: _buildItem
    );
  }
}