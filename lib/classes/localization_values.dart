import 'package:flutter/foundation.dart';
import 'article.dart';
import 'amendment.dart';
import 'section.dart';
import 'preamble.dart';
import 'package:constitution/widgets/app_bottom_navigation_bar/app_bottom_navigation_bar_localizations.dart';
import 'package:constitution/widgets/amendment_card/amendment_card_localizations.dart';
import 'package:constitution/widgets/article_card/article_card_localizations.dart';
import 'package:constitution/widgets/amendment_list_view/amendment_list_view_localizations.dart';
import 'package:constitution/widgets/article_list_view/article_list_view_localizations.dart';
import 'package:constitution/widgets/content_view/content_view_localizations.dart';
import 'package:constitution/routes/settings_route/settings_route_localizations.dart';
import 'package:constitution/routes/home_route/home_route_localizations.dart';
import 'package:constitution/widgets/app_search_delegate/app_search_delegate_localizations.dart';

class LocalizationValues {
  final String title;
  final Preamble preamble;
  final List<Article> articles;
  final List<Section> content;
  final List<Amendment> amendments;
  final AppBottomNavigationBarLocalizations bottomNavigationBar;
  final AmendmentCardLocalizations amendmentCard;
  final ArticleCardLocalizations articleCard;
  final AmendmentListViewLocalizations amendmentListView;
  final ArticleListViewLocalizations articleListView;
  final ContentViewLocalizations contentView;
  final SettingsRouteLocalizations settingsRoute;
  final HomeRouteLocalizations homeRoute;
  final AppSearchDelegateLocalizations appSearchDelegate;

  LocalizationValues({
    @required this.title,
    @required this.preamble,
    @required this.articles,
    @required this.content,
    @required this.amendments,
    @required this.bottomNavigationBar,
    @required this.articleCard,
    @required this.articleListView,
    @required this.contentView,
    @required this.amendmentCard,
    @required this.amendmentListView,
    @required this.settingsRoute,
    @required this.homeRoute,
    @required this.appSearchDelegate
  });
}