import '../../classes/localization_values.dart';
import 'package:constitution/l10n/uk/preamble_uk.dart';
import 'package:constitution/l10n/uk/articles_uk.dart';
import 'package:constitution/l10n/uk/content_uk.dart';
import 'package:constitution/l10n/uk/amendments_uk.dart';
import 'package:constitution/widgets/app_bottom_navigation_bar/app_bottom_navigation_bar_localizations.dart';
import 'package:constitution/widgets/amendment_card/amendment_card_localizations.dart';
import 'package:constitution/widgets/article_card/article_card_localizations.dart';
import 'package:constitution/widgets/amendment_list_view/amendment_list_view_localizations.dart';
import 'package:constitution/widgets/article_list_view/article_list_view_localizations.dart';
import 'package:constitution/widgets/content_view/content_view_localizations.dart';
import 'package:constitution/routes/settings_route/settings_route_localizations.dart';
import 'package:constitution/routes/home_route/home_route_localizations.dart';
import 'package:constitution/widgets/app_search_delegate/app_search_delegate_localizations.dart';

LocalizationValues localizationValuesUK = LocalizationValues(
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
        fontSize: 'Размер шрифта',
        fontSizeDefault: 'по умолчанию',
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