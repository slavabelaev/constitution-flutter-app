import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/app_search_delegate.dart';
import '../widgets/content_view.dart';
import '../widgets/article_list_view.dart';
import '../widgets/amendment_list_view.dart';
import '../models/app_model.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int _currentIndex;

  Widget _buildContentTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ContentView(app.content)
    );
  }

  Widget _buildArticlesTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ArticleListView(
          app.articles,
          emptyMessage: 'Нет статей',
        )
    );
  }

  Widget _buildFavoritesTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => ArticleListView(
          app.favoriteArticles,
          emptyMessage: 'Нет закладок'
        )
    );
  }

  Widget _buildAmendmentsTabPage() {
    return Consumer<AppModel>(
        builder: (context, app, child) => AmendmentsListView(app.amendments)
    );
  }

  Widget _buildBody() {
    switch(_currentIndex) {
      case 1: return _buildArticlesTabPage();
      case 2: return _buildFavoritesTabPage();
      case 3: return _buildAmendmentsTabPage();
      default: return _buildContentTabPage();
    }
  }

  void _handleIndexChange(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  _buildSearchAction() {
    return Consumer<AppModel>(
      builder: (context, app, child) =>
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => showSearch(
            context: context,
            delegate: AppSearchDelegate(app.articles)
          )
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Конституция ПМР'),
        actions: <Widget>[
          _buildSearchAction(),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => null
          )
          //_LanguagePopupMenuButton()
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: AppBottomNavigationBar(
        onIndexChange: _handleIndexChange
      ),
    );
  }
}