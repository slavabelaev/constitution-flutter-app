import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../models/app_model.dart';
import '../classes/article.dart';
import '../classes/paragraph.dart';
import '../classes/sub_paragraph.dart';

class ArticleCard extends StatefulWidget {
  ArticleCard(this.article);

  final Article article;

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool checked = false;

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
      margin: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
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
          'Пункт ${paragraph.number}',
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
    String articleText = 'СТАТЬЯ ${article.number}' + lineBreak;

    if (article.parts != null) articleText += article.parts.join(lineBreak) + lineBreak;

    if (article.paragraphs != null) {
      article.paragraphs.forEach((paragraph) {
        if (paragraph.number != null) articleText += 'Пункт ${paragraph.number}'.toUpperCase() + lineBreak;
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
                'Статья ${article.number}',
                style: Theme.of(context).textTheme.title
            ),
            padding: const EdgeInsets.all(16.0),
          )
      );
    }

    Widget _buildShareButton() {
      return Tooltip(
        message: 'Поделиться',
        child: IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _shareArticle(article)
        ),
      );
    }

    Widget _buildAddToBookmarksButton() {
      return Tooltip(
        message: 'Добавить в закладки',
        child: Consumer<AppModel>(
          builder: (context, appModel, child) => IconButton(
              icon:
              Icon(appModel.containsInFavorites(article) ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                appModel.toggleFavorite(article);
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

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}