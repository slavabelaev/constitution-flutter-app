import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../../widgets/custom_divider/custom_divider.dart';
import '../../models/favorites_model.dart';
import '../../classes/article.dart';
import '../../classes/paragraph.dart';
import '../../classes/sub_paragraph.dart';
import '../../l10n/app_localizations.dart';
import 'article_card_localizations.dart';

class ArticleCard extends StatefulWidget {
  ArticleCard(this.article, {this.highlight});

  final Article article;
  final String highlight;

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool checked = false;

  ArticleCardLocalizations get localizations => AppLocalizations.of(context).articleCard;

  void _toggleCheck(Article article) {
    setState(() => checked = !checked);
  }

  TextStyle get _titleStyle => Theme.of(context).textTheme.title.copyWith(
    fontSize: Theme.of(context).textTheme.title.fontSize * 1.125
  );

  TextStyle get _paragraphTitleStyle => Theme.of(context).textTheme.title;

  TextStyle get _subParagraphTitleStyle => Theme.of(context).textTheme.title.copyWith(
      fontSize: Theme.of(context).textTheme.body1.fontSize
  );

  TextStyle get _textStyle => Theme.of(context).textTheme.body1;

  Widget _buildSubParagraph(SubParagraph subParagraph, bool isLast) {
    return Container(
      child: Text.rich(TextSpan(
          children: [
            TextSpan(
                text: '${subParagraph.title}) ',
                style: _subParagraphTitleStyle
            ),
            _buildHighlightedTextSpan(subParagraph.text)
          ]
      )),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8.0),
    );
  }

  Widget _buildSubParagraphs(List<SubParagraph> subParagraphs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: subParagraphs.map(
        (item) => _buildSubParagraph(item, item == subParagraphs.last)
      ).toList(),
    );
  }

  Widget _buildParagraph(Paragraph paragraph) {
    bool _hasIntroduction = (paragraph.introduction != null);
    bool _hasSubParagraphs = (paragraph.subParagraphs != null);
    bool _hasConclusion = (paragraph.conclusion != null);

    Widget _buildHeader() {
      return Container(
        child: Text(
          '${localizations.paragraph} ${paragraph.number}',
          style: _paragraphTitleStyle,
        ),
        margin: const EdgeInsets.only(bottom: 16.0),
      );
    };

    Widget _buildIntroductionIfExists() {
      return _hasIntroduction ? Container(
        child: _buildSplitText(paragraph.introduction),
        margin: EdgeInsets.only(bottom: _hasSubParagraphs ? 16.0 : 0),
      ) : Container();
    }

    Widget _buildSubParagraphsIfExists() =>
      _hasSubParagraphs ? Container(
        child: _buildSubParagraphs(paragraph.subParagraphs),
        margin: EdgeInsets.only(bottom: _hasConclusion ? 16.0 : 0),
      ) : Container();

    Widget _buildConclusionIfExists() =>
        _hasConclusion ? _buildSplitText(paragraph.conclusion) : Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomDivider(),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildHeader(),
                  _buildIntroductionIfExists(),
                ],
              ),
              _buildSubParagraphsIfExists(),
              _buildConclusionIfExists()
            ],
          ),
          padding: const EdgeInsets.all(16.0),
        )
      ],
    );
  }

  Widget _buildParagraphs() {
    List<Paragraph> paragraphs = widget.article.paragraphs;

    if (paragraphs == null) return Container();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: paragraphs.map(_buildParagraph).toList(),
      )
    );
  }

  String _getArticleAsPlainText(Article article) {
    String lineBreak = '\r\n\r\n';
    String articleText = '${localizations.article} ${article.number}' + lineBreak;

    if (article.introduction != null) articleText += article.introduction.join(lineBreak) + lineBreak;

    if (article.paragraphs != null) {
      article.paragraphs.forEach((paragraph) {
        if (paragraph.number != null) articleText += '${localizations.paragraph} ${paragraph.number}'.toUpperCase() + lineBreak;
        if (paragraph.introduction != null) articleText += paragraph.introduction.join(lineBreak) + lineBreak;
        if (paragraph.subParagraphs != null) {
          paragraph.subParagraphs.forEach((subParagraph) {
            articleText += '${subParagraph.title}) ${subParagraph.text}' + lineBreak;
          });
        }

        if (paragraph.conclusion != null) articleText += paragraph.conclusion.join(lineBreak) + lineBreak;

      });
    }

    if (article.conclusion != null) articleText += article.conclusion.join(lineBreak) + lineBreak;

    return articleText;
  }

  void _shareArticle(Article article) {
    String articleText = _getArticleAsPlainText(article);
    Share.share(
      articleText,
      subject: 'Статья ${article.number}'
    );
  }

  Widget _buildSplitText(List<String> textElements) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: textElements.map(
            (text) => Container(
              child: Text.rich(
                _buildHighlightedTextSpan(text)
              ),
              //child: Text(text),
              margin: EdgeInsets.only(bottom: text != textElements.last ? 16.0 : 0),
            )
        ).toList()
    );
  }

  TextSpan _buildHighlightedTextSpan(String text) {
    if (widget.highlight == null)
      return TextSpan(text: text);

    RegExp splitter = RegExp(
        widget.highlight,
        caseSensitive: false,
        multiLine: true
    );
    List<TextSpan> children = [];

    TextSpan _buildMatch(String text) {
      return TextSpan(text: text, style: _textStyle.copyWith(
        backgroundColor: Theme.of(context).highlightColor
      ));
    }

    TextSpan _buildNonMatch(String text) {
      return TextSpan(text: text, style: _textStyle);
    }

    text.splitMapJoin(
      splitter,
      onMatch: (match) {
        String matchText = match.group(0);
        children.add(
          _buildMatch(matchText)
        );
        return matchText;
      },
      onNonMatch: (nonMatchText) {
        children.add(
          _buildNonMatch(nonMatchText)
        );
        return nonMatchText;
      }
    );

    return TextSpan(
      children: children
    );
  }

  Widget _buildCardHeader() {
    Article article = widget.article;

    Widget _buildTitle() {
      return Expanded(
          child: Container(
            child: Text(
                '${localizations.article} ${article.number}',
                style: _titleStyle
            ),
            padding: const EdgeInsets.all(16.0),
          )
      );
    }

    Widget _buildShareButton() {
      return Tooltip(
        message: localizations.share,
        child: IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _shareArticle(article)
        ),
      );
    }

    Widget _buildAddToBookmarksButton() {
      return Tooltip(
        message: localizations.addToBookmarks,
        child: Consumer<FavoritesModel>(
          builder: (context, favorites, child) => IconButton(
              icon:
              Icon(favorites.contains(article.uid) ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                favorites.toggle(article.uid);
                _toggleCheck(article);
              }
          ),
        ),
      );
    }

    return Row(
      children: <Widget>[
        _buildTitle(),
        _buildShareButton(),
        _buildAddToBookmarksButton()
      ],
    );
  }

  Widget _buildArticleText(List<String> texts) {
    if (texts == null) return Container();

    return Container(
      child: _buildSplitText(texts),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    );
  }

  Widget _buildArticleIntroduction() {
    return _buildArticleText(widget.article.introduction);
  }

  Widget _buildArticleConclusion() {
    return _buildArticleText(widget.article.conclusion);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCardHeader(),
          _buildArticleIntroduction(),
          _buildParagraphs(),
          _buildArticleConclusion()
        ],
      )
    );
  }

}