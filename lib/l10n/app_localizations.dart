import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'package:constitution/classes/localization_values.dart';
import '../classes/article.dart';
import '../classes/amendment.dart';
import '../classes/section.dart';
import '../classes/preamble.dart';
import 'package:constitution/widgets/app_bottom_navigation_bar/app_bottom_navigation_bar_localizations.dart';
import 'package:constitution/widgets/amendment_card/amendment_card_localizations.dart';
import 'package:constitution/widgets/article_card/article_card_localizations.dart';
import 'package:constitution/widgets/amendment_list_view/amendment_list_view_localizations.dart';
import 'package:constitution/widgets/article_list_view/article_list_view_localizations.dart';
import 'package:constitution/widgets/content_view/content_view_localizations.dart';
import 'package:constitution/routes/settings_route/settings_route_localizations.dart';
import 'package:constitution/routes/home_route/home_route_localizations.dart';
import 'package:constitution/widgets/app_search_delegate/app_search_delegate_localizations.dart';

import '../models/settings_model.dart';

import 'ru/localization_values_ru.dart';
import 'md/localization_values_md.dart';
import 'uk/localization_values_uk.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  
  static AppLocalizations of(BuildContext context) {
    SettingsModel settingsModel = Provider.of<SettingsModel>(context);
    return (settingsModel.locale != null) ?
      AppLocalizations(settingsModel.locale) :
      Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, LocalizationValues> _localizedValues = {
    'ru': localizationValuesRU,
    'md': localizationValuesMD,
    'uk': localizationValuesUK,
  };

  String get languageCode => locale.languageCode;
  String get title =>  _localizedValues[languageCode].title;
  Preamble get preamble => _localizedValues[languageCode].preamble;
  List<Article> get articles => _localizedValues[languageCode].articles;
  List<Section> get content => _localizedValues[languageCode].content;
  List<Amendment> get amendments => _localizedValues[languageCode].amendments;
  AppBottomNavigationBarLocalizations get bottomNavigationBar => _localizedValues[languageCode].bottomNavigationBar;
  ArticleCardLocalizations get articleCard => _localizedValues[languageCode].articleCard;
  ArticleListViewLocalizations get articleListView => _localizedValues[languageCode].articleListView;
  ContentViewLocalizations get contentView => _localizedValues[languageCode].contentView;
  AmendmentListViewLocalizations get amendmentListView => _localizedValues[languageCode].amendmentListView;
  AmendmentCardLocalizations get amendmentCard => _localizedValues[languageCode].amendmentCard;
  AppSearchDelegateLocalizations get appSearchDelegate => _localizedValues[languageCode].appSearchDelegate;
  SettingsRouteLocalizations get settingsRoute => _localizedValues[languageCode].settingsRoute;
  HomeRouteLocalizations get homeRoute => _localizedValues[languageCode].homeRoute;

  static get delegate => const AppLocalizationsDelegate();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'md', 'uk'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}