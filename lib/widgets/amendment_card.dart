import 'package:flutter/material.dart';
import '../classes/amendment.dart';

class AmendmentCard extends StatelessWidget {
  AmendmentCard(this.amendment);

  final Amendment amendment;

  bool _hasSection() => (amendment.sectionName != null);
  bool _hasChapter() => (amendment.chapterNumber != null);
  bool _hasArticle() => (amendment.articleNumber != null);
  bool _hasParagraph() => (amendment.paragraphNumber != null);
  bool _hasSubParagraph() => (amendment.subParagraphName != null);
  bool _hasPart() => (amendment.partNumber != null);
  bool _hasSentence() => (amendment.sentenceNumber != null);

  TextSpan _buildSection() {
    return  _hasSection() ?
      TextSpan(text: 'раздел ${amendment.sectionName} ') :
      TextSpan();
  }

  TextSpan _buildChapter() {
    return _hasChapter() ?
      TextSpan(text: 'глава ${amendment.chapterNumber} ') :
      TextSpan();
  }

  TextSpan _buildArticle() {
    return _hasArticle() ?
      TextSpan(text: 'статья ${amendment.articleNumber} ') :
      TextSpan();
  }

  TextSpan _buildParagraph() {
    return _hasParagraph() ?
      TextSpan(text: 'пункт ${amendment.paragraphNumber} ') :
      TextSpan();
  }

  TextSpan _buildSubParagraph() {
    return _hasSubParagraph() ?
      TextSpan(text: 'подпункт ${amendment.subParagraphName}) ') :
      TextSpan();
  }

  TextSpan _buildPart() {
    return _hasPart() ?
      TextSpan(text: 'часть ${amendment.partNumber} ') :
      TextSpan();
  }

  TextSpan _buildSentence() {
    return _hasSentence() ?
    TextSpan(text: 'предложение ${amendment.sentenceNumber} ') : TextSpan();
  }

  _buildTitle() {
    return Text.rich(
        TextSpan(
            children: [
              _buildSection(),
              _buildChapter(),
              _buildArticle(),
              _buildParagraph(),
              _buildSubParagraph(),
              _buildPart(),
              _buildSentence()
            ]
        )
    );
  }

  _getOperationName() {
    switch(amendment.operation) {
      case AmendmentOperation.ADDED: return 'дополнение';
      case AmendmentOperation.CHANGED: return 'правка';
      case AmendmentOperation.REMOVED: return 'удаление';
      case AmendmentOperation.RENAMED: return 'переименование';
      case AmendmentOperation.REPLACED: return 'перемещение';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
//    List<String> dateElements = amendment.lawDateFrom.split('-');
//    DateTime dateTime = DateTime(
//      int.parse(dateElements[0]),
//      int.parse(dateElements[1]),
//      int.parse(dateElements[2])
//    );
    //print(int.parse(dateElements[1]));
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Закон ${amendment.lawNumber}', style: Theme.of(context).textTheme.title),
                Container(
                  child: Text(
                    _getOperationName(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70
                    )
                  ),
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                )
              ],
            ),
            subtitle: Text('от ${amendment.lawDateFrom}'),
          ),
          Padding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTitle(),
                  Text('Источник: ${amendment.publishedIn}')
                ],
              ),
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0)
          )
        ],
      ),
      margin: const EdgeInsets.all(0),
    );
  }
}