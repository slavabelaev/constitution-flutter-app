import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/app_bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:constitution/widgets/app_search_delegate/app_search_delegate.dart';
import 'package:constitution/widgets/content_view/content_view.dart';
import 'package:constitution/widgets/article_list_view/article_list_view.dart';
import 'package:constitution/widgets/amendment_list_view/amendment_list_view.dart';
import '../../models/favorites_model.dart';
import '../../routes/settings_route./settings_route.dart';
import '../../l10n/app_localizations.dart';
import 'home_route_localizations.dart';
import '../../models/settings_model.dart';

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
        builder: (context, favorites, child) {
          return ArticleListView(
              favorites.filter(AppLocalizations.of(context).articles),
              emptyMessage: localizations.noBookmarks
          );
        }
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

  TextStyle get _popupMenuItemStyle => Theme.of(context).textTheme.body1;

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
            child: Text(
              localizations.chooseLanguage,
              style: _popupMenuItemStyle,
            ),
          ),
          PopupMenuItem(
            value: popupMenuOptions.settings,
            child: Text(
              localizations.settings,
              style: _popupMenuItemStyle,
            ),
          )
        ]
    );
  }

  void switchLocale(String languageCode) {
    SettingsModel settingsModel = Provider.of<SettingsModel>(context);
    settingsModel.switchLocale(Locale(languageCode));
    Navigator.pop(context);
  }

  void _showLanguageDialog() {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Русский'),
              onPressed: () => switchLocale('ru')
            ),
            SimpleDialogOption(
                child: Text('Молдавеняскэ'),
                onPressed: () => switchLocale('md')
            ),
            SimpleDialogOption(
                child: Text('Український'),
                onPressed: () => switchLocale('uk')
            )
          ],
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