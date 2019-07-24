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
import 'package:constitution/l10n/ua/preamble_ua.dart';
import 'package:constitution/l10n/ua/articles_ua.dart';
import 'package:constitution/l10n/ua/content_ua.dart';
import 'package:constitution/l10n/ua/amendments_ua.dart';

import '../classes/article.dart';
import '../classes/amendment.dart';
import '../classes/section.dart';
import '../classes/preamble.dart';
import '../models/locale_model.dart';

class LocalizationValues {
  final String title;
  final Preamble preamble;
  final List<Article> articles;
  final List<Section> content;
  final List<Amendment> amendments;
  final BottomNavigationBarLocalizations bottomNavigationBar;
  final AmendmentCardLocalizations amendmentCard;
  final ArticleCardLocalizations articleCard;
  final AmendmentListViewLocalizations amendmentListView;
  final ArticleListViewLocalizations articleListView;
  final SettingsRouteLocalizations settingsRoute;
  final HomeRouteLocalizations homeRoute;

  LocalizationValues({
    this.title,
    this.preamble,
    this.articles,
    this.content,
    this.amendments,
    this.bottomNavigationBar,
    this.articleCard,
    this.articleListView,
    this.amendmentCard,
    this.amendmentListView,
    this.settingsRoute,
    this.homeRoute
  });
}

class BottomNavigationBarLocalizations {
  final String byTopic;
  final String articles;
  final String bookmarks;
  final String amendments;

  BottomNavigationBarLocalizations({
    this.byTopic,
    this.articles,
    this.bookmarks,
    this.amendments
  });
}

class AmendmentCardLocalizations {
  final String section;
  final String chapter;
  final String article;
  final String paragraph;
  final String subParagraph;
  final String part;
  final String sentence;
  final String added;
  final String changed;
  final String removed;
  final String renamed;
  final String replaced;
  final String replacedTo;
  final String publishedIn;
  final String law;
  final String from;

  AmendmentCardLocalizations({
    this.section,
    this.chapter,
    this.article,
    this.paragraph,
    this.subParagraph,
    this.part,
    this.sentence,
    this.added,
    this.changed,
    this.removed,
    this.renamed,
    this.replaced,
    this.replacedTo,
    this.publishedIn,
    this.law,
    this.from
  });
}

class ArticleCardLocalizations {
  final String article;
  final String paragraph;
  final String share;
  final String addToBookmarks;

  ArticleCardLocalizations({
    this.article,
    this.paragraph,
    this.share,
    this.addToBookmarks
  });
}

class SettingsRouteLocalizations {
  final String title;
  final String darkTheme;
  final String fontSize;

  SettingsRouteLocalizations({
    this.title,
    this.darkTheme,
    this.fontSize
  });
}

class HomeRouteLocalizations {
  final String noArticles;
  final String noBookmarks;
  final String chooseLanguage;
  final String settings;

  HomeRouteLocalizations({
    this.noArticles,
    this.noBookmarks,
    this.chooseLanguage,
    this.settings
  });
}

class AmendmentListViewLocalizations {
  AmendmentListViewLocalizations();
}

class ArticleListViewLocalizations {
  final emptyMessage;

  ArticleListViewLocalizations({
    this.emptyMessage
  });
}

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    LocaleModel localeModel = Provider.of<LocaleModel>(context);
    return (localeModel.locale != null) ?
      AppLocalizations(localeModel.locale) :
      Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, LocalizationValues> _localizedValues = {
    'ru': LocalizationValues(
      title: 'Конституция ПМР',
      preamble: preamble_ru,
      articles: articles_ru,
      content: content_ru,
      amendments: amendments_ru,
      bottomNavigationBar: BottomNavigationBarLocalizations(
        byTopic: 'По темам',
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
      amendmentCard: AmendmentCardLocalizations(
          section: 'раздел',
          chapter: 'глава',
          article: 'статья',
          paragraph: 'пункт',
          subParagraph: 'подпункт',
          part: 'часть',
          sentence: 'предложение',
          added: 'Дополнено',
          changed: 'Исправлено',
          removed: 'Удалено',
          renamed: 'Переименовано',
          replaced: 'Перемещено из',
          replacedTo: 'Перемещено в',
          publishedIn: 'Опубликовано в',
          law: 'Закон',
          from: 'от'
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
      preamble: preamble_md,
      articles: articles_md,
      content: content_md,
      amendments: amendments_md,
      bottomNavigationBar: BottomNavigationBarLocalizations(
        byTopic: 'По темам',
        articles: 'Статьи',
        bookmarks: 'Закладки',
        amendments: 'Поправки'
      ),
      articleListView: ArticleListViewLocalizations(
        emptyMessage: 'Ничего нет'
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
        changed: 'Исправлено',
        removed: 'Удалено',
        renamed: 'Переименовано',
        replaced: 'Перемещено из',
        replacedTo: 'Перемещено в',
        publishedIn: 'Опубликовано в',
        law: 'Закон',
        from: 'от'
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
    'ua': LocalizationValues(
      title: 'Конституція ПМР',
      preamble: preamble_ua,
      articles: articles_ua,
      content: content_ua,
      amendments: amendments_ua,
      bottomNavigationBar: BottomNavigationBarLocalizations(
        byTopic: 'За темами',
        articles: 'Статті',
        bookmarks: 'Закладки',
        amendments: 'Поправки'
      ),
      articleListView: ArticleListViewLocalizations(
        emptyMessage: 'Ничего нет'
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
        changed: 'Исправлено',
        removed: 'Удалено',
        renamed: 'Переименовано',
        replaced: 'Перемещено из',
        replacedTo: 'Перемещено в',
        publishedIn: 'Опубликовано в',
        law: 'Закон',
        from: 'от'
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
  BottomNavigationBarLocalizations get bottomNavigationBar => _localizedValues[locale.languageCode].bottomNavigationBar;
  ArticleCardLocalizations get articleCard => _localizedValues[locale.languageCode].articleCard;
  ArticleListViewLocalizations get articleListView => _localizedValues[locale.languageCode].articleListView;
  AmendmentListViewLocalizations get amendmentListView => _localizedValues[locale.languageCode].amendmentListView;
  AmendmentCardLocalizations get amendmentCard => _localizedValues[locale.languageCode].amendmentCard;
  SettingsRouteLocalizations get settingsRoute => _localizedValues[locale.languageCode].settingsRoute;
  HomeRouteLocalizations get homeRoute => _localizedValues[locale.languageCode].homeRoute;

  static get delegate => const AppLocalizationsDelegate();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'ua', 'md'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}