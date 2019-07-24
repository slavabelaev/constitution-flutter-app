import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../widgets/custom_divider.dart';
import '../models/favorites_model.dart';
import '../classes/article.dart';
import '../classes/paragraph.dart';
import '../classes/sub_paragraph.dart';
import '../l10n/app_localizations.dart';

class ArticleCard extends StatefulWidget {
  ArticleCard(this.article);

  final Article article;

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool checked = false;

  ArticleCardLocalizations get localizations => AppLocalizations.of(context).articleCard;

  void _toggleCheck(Article article) {
    setState(() => checked = !checked);
  }

  final TextStyle _subParagraphTitleStyle = TextStyle(
      fontWeight: FontWeight.bold
  );
  final TextStyle _paragraphTitleStyle = TextStyle(
      fontSize: 18.0,
      height: 1,
      fontWeight: FontWeight.w600
  );

  Widget _buildSubParagraph(SubParagraph subParagraph, bool isLast) {
    return Container(
      child: Text.rich(TextSpan(
          children: [
            TextSpan(
                text: '${subParagraph.title}) ',
                style: _subParagraphTitleStyle
            ),
            TextSpan(text: '${subParagraph.text}')
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
      _hasSubParagraphs ? _buildSubParagraphs(paragraph.subParagraphs) : Container();

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

    if (article.parts != null) articleText += article.parts.join(lineBreak) + lineBreak;

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
              child: Text(text, style: Theme.of(context).textTheme.body1),
              margin: EdgeInsets.only(bottom: text != textElements.last ? 16.0 : 0),
            )
        ).toList()
    );
  }

  Widget _buildCardHeader() {
    Article article = widget.article;

    Widget _buildTitle() {
      return Expanded(
          child: Container(
            child: Text(
                '${localizations.article} ${article.number}',
                style: Theme.of(context).textTheme.title
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
              Icon(favorites.contains(article) ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                favorites.toggle(article);
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

  Widget _buildArticleText() {
    Article _article = widget.article;

    if (_article.parts == null) return Container();

    return Container(
      child: _buildSplitText(_article.parts),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCardHeader(),
          _buildArticleText(),
          _buildParagraphs()
        ],
      )
    );
  }

}