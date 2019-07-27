import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
// l10n Russian
import 'package:constitution/l10n/ru/preamble_ru.dart';
import 'package:constitution/l10n/ru/articles_ru.dart';
import 'package:constitution/l10n/ru/content_ru.dart';
import 'package:constitution/l10n/ru/amendments_ru.dart';
// l10n Moldavian
import 'package:constitution/l10n/md/preamble_md.dart';
import 'package:constitution/l10n/md/articles_md.dart';
import 'package:constitution/l10n/md/content_md.dart';
import 'package:constitution/l10n/md/amendments_md.dart';
// l10n Ukraine
import 'package:constitution/l10n/uk/preamble_uk.dart';
import 'package:constitution/l10n/uk/articles_uk.dart';
import 'package:constitution/l10n/uk/content_uk.dart';
import 'package:constitution/l10n/uk/amendments_uk.dart';

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
    'ru': LocalizationValues(
      title: 'Конституция ПМР',
      preamble: preambleRU,
      articles: articlesRU,
      content: contentRU,
      amendments: amendmentsRU,
      bottomNavigationBar: AppBottomNavigationBarLocalizations(
        byTopic: 'Темы',
        articles: 'Статьи',
        bookmarks: 'Закладки',
        amendments: 'Поправки'
      ),
      articleCard: ArticleCardLocalizations(
        article: 'Статья',
        paragraph: 'Пункт',
        share: 'Поделиться',
        addToBookmarks: 'Добавить в закладки'
      ),
      articleListView: ArticleListViewLocalizations(
        emptyMessage: 'Ничего нет'
      ),
      contentView: ContentViewLocalizations(
        articles: 'Статьи'
      ),
      amendmentCard: AmendmentCardLocalizations(
          section: 'раздел',
          chapter: 'глава',
          article: 'статья',
          paragraph: 'пункт',
          subParagraph: 'подпункт',
          part: 'часть',
          sentence: 'предложение',
          added: 'Дополнение',
          changed: 'Изменение',
          removed: 'Исключение',
          renamed: 'Переименование',
          replaced: 'Перенос в',
          replacedTo: 'Перенос из',
          publishedIn: 'Публикация',
          law: 'Закон',
          from: 'от'
      ),
      appSearchDelegate: AppSearchDelegateLocalizations(
        startSearch: 'Начинайте вводить',
        noResults: 'Ничего не найдено',
        back: 'Вернуться',
        clear: 'Очистить'
      ),
      settingsRoute: SettingsRouteLocalizations(
        title: 'Настройки',
        darkTheme: 'Темная тема',
        fontSize: 'Размер шрифта'
      ),
      homeRoute: HomeRouteLocalizations(
        noArticles: 'Нет статей',
        noBookmarks: 'Нет закладок',
        chooseLanguage: 'Выбрать язык',
        settings: 'Настройки'
      )
    ),
    'md': LocalizationValues(
      title: 'Конституция РМН',
      preamble: preambleMD,
      articles: articlesMD,
      content: contentMD,
      amendments: amendmentsMD,
      bottomNavigationBar: AppBottomNavigationBarLocalizations(
        byTopic: 'Субьектеле',
        articles: 'Артиколе',
        bookmarks: 'Маркаӂе',
        amendments: 'Амендаменте'
      ),
      articleListView: ArticleListViewLocalizations(
        emptyMessage: 'Нимик'
      ),
      contentView: ContentViewLocalizations(
        articles: 'Артиколе'
      ),
      articleCard: ArticleCardLocalizations(
        article: 'Артиколул',
        paragraph: 'Пунктул',
        share: 'Тримитети',
        addToBookmarks: 'Адаугати ла маркаӂе'
      ),
      amendmentCard: AmendmentCardLocalizations(
        section: 'титлул',
        chapter: 'капитолул',
        article: 'артиколул',
        paragraph: 'пунктул',
        subParagraph: 'суб пунктул',
        part: 'парте',
        sentence: 'пропунере',
        added: 'Модификат',
        changed: 'Фиксат',
        removed: 'Елеминат',
        renamed: 'Реденумит',
        replaced: 'Мутат де ла',
        replacedTo: 'Мутат ла',
        publishedIn: 'Постат ын',
        law: 'Лежя',
        from: 'де ла'
      ),
      appSearchDelegate: AppSearchDelegateLocalizations(
        startSearch: 'Начинайте вводить',
        noResults: 'Ничего не найдено',
        back: 'Вернуться',
        clear: 'Очистить'
      ),
      settingsRoute: SettingsRouteLocalizations(
        title: 'Сетэриле',
        darkTheme: 'Тема ынтунеката',
        fontSize: 'Дименсиуня фонтулуй'
      ),
      homeRoute: HomeRouteLocalizations(
          noArticles: 'Ну екзистэ артикол',
          noBookmarks: 'Ну екзистэ маркаӂе',
          chooseLanguage: 'Селектат лимба',
          settings: 'Сетэриле'
      )
    ),
    'uk': LocalizationValues(
      title: 'Конституція ПМР',
      preamble: preambleUK,
      articles: articlesUK,
      content: contentUK,
      amendments: amendmentsUK,
      bottomNavigationBar: AppBottomNavigationBarLocalizations(
        byTopic: 'Теми',
        articles: 'Статті',
        bookmarks: 'Закладки',
        amendments: 'Поправки'
      ),
      articleListView: ArticleListViewLocalizations(
        emptyMessage: 'Ничего нет'
      ),
      contentView: ContentViewLocalizations(
        articles: 'Статьи'
      ),
      articleCard: ArticleCardLocalizations(
        article: 'Статья',
        paragraph: 'Пункт',
        share: 'Поделиться',
        addToBookmarks: 'Добавить в закладки'
      ),
      amendmentCard: AmendmentCardLocalizations(
        section: 'раздел',
        chapter: 'глава',
        article: 'статья',
        paragraph: 'пункт',
        subParagraph: 'подпункт',
        part: 'часть',
        sentence: 'предложение',
        added: 'Дополнено',
        changed: 'Изменено',
        removed: 'Удалено',
        renamed: 'Переименовано',
        replaced: 'Перемещено из',
        replacedTo: 'Перемещено в',
        publishedIn: 'Опубликовано в',
        law: 'Закон',
        from: 'от'
      ),
      appSearchDelegate: AppSearchDelegateLocalizations(
        startSearch: 'Начинайте вводить',
        noResults: 'Ничего не найдено',
        back: 'Вернуться',
        clear: 'Очистить'
      ),
      settingsRoute: SettingsRouteLocalizations(
        title: 'Настройки',
        darkTheme: 'Темная тема',
        fontSize: 'Размер шрифта'
      ),
      homeRoute: HomeRouteLocalizations(
          noArticles: 'Нет статей',
          noBookmarks: 'Нет закладок',
          chooseLanguage: 'Выбрать язык',
          settings: 'Настройки'
      )
    ),
  };

  String get title =>  _localizedValues[locale.languageCode].title;
  Preamble get preamble => _localizedValues[locale.languageCode].preamble;
  List<Article> get articles => _localizedValues[locale.languageCode].articles;
  List<Section> get content => _localizedValues[locale.languageCode].content;
  List<Amendment> get amendments => _localizedValues[locale.languageCode].amendments;
  AppBottomNavigationBarLocalizations get bottomNavigationBar => _localizedValues[locale.languageCode].bottomNavigationBar;
  ArticleCardLocalizations get articleCard => _localizedValues[locale.languageCode].articleCard;
  ArticleListViewLocalizations get articleListView => _localizedValues[locale.languageCode].articleListView;
  ContentViewLocalizations get contentView => _localizedValues[locale.languageCode].contentView;
  AmendmentListViewLocalizations get amendmentListView => _localizedValues[locale.languageCode].amendmentListView;
  AmendmentCardLocalizations get amendmentCard => _localizedValues[locale.languageCode].amendmentCard;
  AppSearchDelegateLocalizations get appSearchDelegate => _localizedValues[locale.languageCode].appSearchDelegate;
  SettingsRouteLocalizations get settingsRoute => _localizedValues[locale.languageCode].settingsRoute;
  HomeRouteLocalizations get homeRoute => _localizedValues[locale.languageCode].homeRoute;

  static get delegate => const AppLocalizationsDelegate();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'uk', 'md'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}