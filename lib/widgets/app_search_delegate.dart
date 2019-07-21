import 'package:flutter/material.dart';
import '../classes/article.dart';
import '../classes/paragraph.dart';
import '../widgets/article_list_view.dart';

class AppSearchDelegate extends SearchDelegate<int> {
  AppSearchDelegate(this.articles);

  final List<Article> articles;
  final List<Article> _history = [];
  List<Article> suggestions;

  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      //primaryColor: Colors.grey[900],
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      //primaryColorBrightness: Brightness.dark,
      primaryTextTheme: theme.textTheme,
    );
  }

  String _getEmptyMessage() {
    return query.isEmpty ? 'Начинайте вводить' : 'Ничего не найдено';
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  bool _hasSuggestionsByText(List<String> textElements) {
    String text = textElements.join();
    return text != null && RegExp(query.toLowerCase())
      .hasMatch(text.toLowerCase());
  }

  bool _hasSuggestionsByNumber(num number) {
    return RegExp(query).hasMatch(number.toString());
  }

  bool _hasSuggestionsByParagraphs(Article article) {
    bool hasParagraphs = article.paragraphs != null && article.paragraphs.length > 0;

    if (!hasParagraphs) return false;

    return article.paragraphs.where((paragraph) =>
      _hasSuggestionsByText(paragraph.introduction) ||
      _hasSuggestionsByText(paragraph.conclusion) ||
      _hasSuggestionsBySubParagraphs(paragraph)
    ).length > 0;
  }

  bool _hasSuggestionsBySubParagraphs(Paragraph paragraph) {
    bool hasSubParagraphs = paragraph.subParagraphs != null && paragraph.subParagraphs.length > 0;

    if (!hasSubParagraphs) return false;

    return paragraph.subParagraphs.where((subParagraph) =>
      _hasSuggestionsByText([subParagraph.text])
    ).length > 0;
  }

  bool _hasSuggestions(Article article) {
    bool hasSuggestionsByText = _hasSuggestionsByText(article.parts);
    bool hasSuggestionsByParagraphs = _hasSuggestionsByParagraphs(article);
    bool hasSuggestionsByNumber = _hasSuggestionsByNumber(article.number);

    return hasSuggestionsByNumber || hasSuggestionsByText || hasSuggestionsByParagraphs;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestions = query.isEmpty
        ? _history
        : articles.where(_hasSuggestions).toList();

    return ArticleListView(
        suggestions,
        emptyMessage: _getEmptyMessage(),
        onItemTap: () => FocusScope.of(context).unfocus(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Article> _results = suggestions;
    if (_results.isEmpty) {
      return _buildNoSuggestions(context, query);
    }

    return ArticleListView(
      suggestions,
      emptyMessage: _getEmptyMessage(),
    );
  }

  Widget _buildNoSuggestions(BuildContext context, String query) {
    return Center(
      child: Text(
        _getEmptyMessage(),
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      (query.isEmpty) ? Container() : IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }
}