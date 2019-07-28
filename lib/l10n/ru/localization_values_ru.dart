import '../../classes/localization_values.dart';
import 'package:constitution/l10n/ru/preamble_ru.dart';
import 'package:constitution/l10n/ru/articles_ru.dart';
import 'package:constitution/l10n/ru/content_ru.dart';
import 'package:constitution/l10n/ru/amendments_ru.dart';
import 'package:constitution/widgets/app_bottom_navigation_bar/app_bottom_navigation_bar_localizations.dart';
import 'package:constitution/widgets/amendment_card/amendment_card_localizations.dart';
import 'package:constitution/widgets/article_card/article_card_localizations.dart';
import 'package:constitution/widgets/amendment_list_view/amendment_list_view_localizations.dart';
import 'package:constitution/widgets/article_list_view/article_list_view_localizations.dart';
import 'package:constitution/widgets/content_view/content_view_localizations.dart';
import 'package:constitution/routes/settings_route/settings_route_localizations.dart';
import 'package:constitution/routes/home_route/home_route_localizations.dart';
import 'package:constitution/widgets/app_search_delegate/app_search_delegate_localizations.dart';

LocalizationValues localizationValuesRU = LocalizationValues(
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
        fontSize: 'Размер шрифта',
        fontSizeDefault: 'обычный',
        fontSizeMedium: 'средний',
        fontSizeLarge: 'большой'
    ),
    homeRoute: HomeRouteLocalizations(
        noArticles: 'Нет статей',
        noBookmarks: 'Нет закладок',
        chooseLanguage: 'Выбрать язык',
        settings: 'Настройки'
    ),
    amendmentListView: AmendmentListViewLocalizations()
);