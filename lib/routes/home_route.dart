import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../widgets/app_search_delegate.dart';
import '../widgets/content_view.dart';
import '../widgets/article_list_view.dart';
import '../widgets/amendment_list_view.dart';
import '../models/favorites_model.dart';
import '../routes/settings_route.dart';
import '../l10n/app_localizations.dart';
import '../models/locale_model.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

enum popupMenuOptions {
  settings,
  chooseLanguage
}

class _HomeRouteState extends State<HomeRoute> {
  int _currentIndex;

  AppLocalizations get contentLocalizations => AppLocalizations.of(context);
  HomeRouteLocalizations get localizations => AppLocalizations.of(context).homeRoute;

  Widget _buildContentTabPage() {
    return ContentView(contentLocalizations.content);
  }

  Widget _buildArticlesTabPage() {
    return ArticleListView(
      contentLocalizations.articles,
      emptyMessage: localizations.noArticles,
    );
  }

  Widget _buildFavoritesTabPage() {
    return Consumer<FavoritesModel>(
        builder: (context, favorites, child) => ArticleListView(
          favorites.articles,
          emptyMessage: localizations.noBookmarks
        )
    );
  }

  Widget _buildAmendmentsTabPage() {
    return AmendmentsListView(contentLocalizations.amendments);
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

  Widget _buildSearchAction() {
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: () => showSearch(
            context: context,
            delegate: AppSearchDelegate(contentLocalizations.articles)
        )
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        onSelected: (selected) {
          switch(selected) {
            case popupMenuOptions.chooseLanguage:
              _showLanguageDialog();
              break;
            case popupMenuOptions.settings:
              _showSettings();
              break;
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: popupMenuOptions.chooseLanguage,
            child: Text(localizations.chooseLanguage),
          ),
          PopupMenuItem(
            value: popupMenuOptions.settings,
            child: Text(localizations.settings),
          )
        ]
    );
  }

  void _showLanguageDialog() {
    showDialog(
        context: context,
        builder: (context) =>
          Consumer<LocaleModel>(builder: (context, locale, child) =>
            SimpleDialog(
              children: <Widget>[
                SimpleDialogOption(
                    child: Text('Русский'),
                    onPressed: () => locale.change(Locale('ru'))
                ),
                SimpleDialogOption(
                    child: Text('Молдавеняскэ'),
                    onPressed: () => locale.change(Locale('md'))
                ),
                SimpleDialogOption(
                    child: Text('Український'),
                    onPressed: () => locale.change(Locale('ua'))
                )
              ],
            )
        )
    );
  }

  void _showSettings() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SettingsRoute()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contentLocalizations.title),
        actions: <Widget>[
          _buildSearchAction(),
          _buildPopupMenu()
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