import 'package:flutter/material.dart';
import '../classes/article.dart';
import '../widgets/article_card.dart';
import '../l10n/app_localizations.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView(this.articles, {this.emptyMessage, this.controller, this.onItemTap});

  final List<Article> articles;
  final String emptyMessage;
  final ScrollController controller;
  final VoidCallback onItemTap;

  ArticleListViewLocalizations localizations;

  Widget _buildEmptyMessage(BuildContext context) {
    return Center(
      child: Text(
          (emptyMessage != null) ? emptyMessage : localizations.emptyMessage,
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
          bottom: (articles[index] == articles.last) ? 0 : 16.0
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context).articleListView;

    if (articles == null || articles.length == 0) {
      return _buildEmptyMessage(context);
    }
      
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        controller: (controller != null) ? controller : ScrollController(),
        itemCount: articles.length,
        itemBuilder: _buildItem
    );
  }
}