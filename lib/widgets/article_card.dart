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
                text: '${subParagraph.name}) ',
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
                  Container(
                    child: Text(
                      'Пункт ${paragraph.name}',
                      style: _paragraphTitleStyle,
                    ),
                    margin: const EdgeInsets.only(bottom: 16.0),
                  ),
                  _hasIntroduction ? _buildSplitText(paragraph.introduction) : Container(),
                ],
              ),
              _hasSubParagraphs ? _buildSubParagraphs(paragraph.subParagraphs) : Container(),
              _hasConclusion ? _buildSplitText(paragraph.conclusion) : Container()
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

    if (article.text != null) articleText += '${article.text}' + lineBreak;

    if (article.paragraphs != null) {
      article.paragraphs.forEach((paragraph) {
        if (paragraph.name != null) articleText += 'Пункт ${paragraph.name}'.toUpperCase() + lineBreak;
        if (paragraph.introduction != null) articleText += paragraph.introduction + lineBreak;
        if (paragraph.subParagraphs != null) {
          paragraph.subParagraphs.forEach((subParagraph) {
            articleText += '${subParagraph.name}) ${subParagraph.text}' + lineBreak;
          });
        }

        if (paragraph.conclusion != null) articleText += paragraph.conclusion + lineBreak;

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

  Widget _buildSplitText(String text) {
    List<String> textElements = text.split('\r\n\r\n');

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

    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
              child: Text(
                  'Статья ${article.number}',
                  style: Theme.of(context).textTheme.title
              ),
              padding: const EdgeInsets.all(16.0),
            )
        ),
        IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _shareArticle(article)
        ),
        Consumer<AppModel>(
          builder: (context, appModel, child) => IconButton(
              icon:
              Icon(appModel.containsInFavorites(article) ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                appModel.toggleFavorite(article);
                _toggleCheck(article);
              }
          ),
        )
      ],
    );
  }

  Widget _buildArticleText() {
    Article _article = widget.article;

    if (_article.text == null) return Container();

    return Container(
      child: _buildSplitText(_article.text),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
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