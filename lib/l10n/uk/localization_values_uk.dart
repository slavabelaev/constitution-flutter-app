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
        emptyMessage: 'Нічого немає'
    ),
    contentView: ContentViewLocalizations(
        articles: 'Статті'
    ),
    articleCard: ArticleCardLocalizations(
        article: 'Стаття',
        paragraph: 'Пункт',
        share: 'Поділитися',
        addToBookmarks: 'Додати в закладки'
    ),
    amendmentCard: AmendmentCardLocalizations(
        section: 'розділ',
        chapter: 'глава',
        article: 'стаття',
        paragraph: 'пункт',
        subParagraph: 'підпункт',
        part: 'частина',
        sentence: 'пропозиція',
        added: 'Доповнення',
        changed: 'Зміна',
        removed: 'Виняток',
        renamed: 'Перейменування',
        replaced: 'Перенесення в',
        replacedTo: 'Перенесення з',
        publishedIn: 'Публікація',
        law: 'Закон',
        from: 'від'
    ),
    appSearchDelegate: AppSearchDelegateLocalizations(
        startSearch: 'Починайте вводити',
        noResults: 'Нічого не знайдено',
        back: 'Повернутися',
        clear: 'Очистити'
    ),
    settingsRoute: SettingsRouteLocalizations(
        title: 'Установки',
        darkTheme: 'Темна тема',
        fontSize: 'Розмір шрифту',
        fontSizeDefault: 'за замовчуванням',
        fontSizeMedium: 'середній',
        fontSizeLarge: 'великий'
    ),
    homeRoute: HomeRouteLocalizations(
        noArticles: 'Немає статей',
        noBookmarks: 'Немає закладок',
        chooseLanguage: 'Вибрати мову',
        settings: 'Установки'
    ),
    amendmentListView: AmendmentListViewLocalizations()
);