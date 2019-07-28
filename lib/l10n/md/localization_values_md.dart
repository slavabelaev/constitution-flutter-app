import '../../classes/localization_values.dart';
import 'package:constitution/l10n/md/preamble_md.dart';
import 'package:constitution/l10n/md/articles_md.dart';
import 'package:constitution/l10n/md/content_md.dart';
import 'package:constitution/l10n/md/amendments_md.dart';
import 'package:constitution/widgets/app_bottom_navigation_bar/app_bottom_navigation_bar_localizations.dart';
import 'package:constitution/widgets/amendment_card/amendment_card_localizations.dart';
import 'package:constitution/widgets/article_card/article_card_localizations.dart';
import 'package:constitution/widgets/amendment_list_view/amendment_list_view_localizations.dart';
import 'package:constitution/widgets/article_list_view/article_list_view_localizations.dart';
import 'package:constitution/widgets/content_view/content_view_localizations.dart';
import 'package:constitution/routes/settings_route/settings_route_localizations.dart';
import 'package:constitution/routes/home_route/home_route_localizations.dart';
import 'package:constitution/widgets/app_search_delegate/app_search_delegate_localizations.dart';

LocalizationValues localizationValuesMD = LocalizationValues(
    title: 'Конституция РМН',
    preamble: preambleMD,
    articles: articlesMD,
    content: contentMD,
    amendments: amendmentsMD,
    bottomNavigationBar: AppBottomNavigationBarLocalizations(
        byTopic: 'Континутул',
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
        subParagraph: 'субпунктул',
        part: 'парте',
        sentence: 'пропунере',
        added: 'Адунаря',
        changed: 'Модификаря',
        removed: 'Ындепэртаре',
        renamed: 'Реденумире',
        replaced: 'Трансферат ла',
        replacedTo: 'Трансферат де ла',
        publishedIn: 'Публикаре',
        law: 'Лежя',
        from: 'де ла'
    ),
    appSearchDelegate: AppSearchDelegateLocalizations(
        startSearch: 'Ынчепець ши тастаць',
        noResults: 'Нимик ну а фост гэсит',
        back: 'Ду-те ынапой',
        clear: 'Штергець'
    ),
    settingsRoute: SettingsRouteLocalizations(
        title: 'Сетэриле',
        darkTheme: 'Тема ынтунеката',
        fontSize: 'Дименсиуня фонтулуй',
        fontSizeDefault: 'ын мод имплицит',
        fontSizeMedium: 'медие',
        fontSizeLarge: 'маре'
    ),
    homeRoute: HomeRouteLocalizations(
        noArticles: 'Ну екзистэ артиколе',
        noBookmarks: 'Ну екзистэ маркаӂе',
        chooseLanguage: 'Селектат лимба',
        settings: 'Сетэриле'
    ),
    amendmentListView: AmendmentListViewLocalizations()
);