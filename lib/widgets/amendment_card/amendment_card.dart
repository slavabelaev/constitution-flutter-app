import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../classes/amendment.dart';
import '../../widgets/custom_divider/custom_divider.dart';
import '../../l10n/app_localizations.dart';
import '../../models/settings_model.dart';
import 'amendment_card_localizations.dart';


class AmendmentCard extends StatelessWidget {
  AmendmentCard(this.amendment);

  AmendmentCardLocalizations localizations;

  final Amendment amendment;

  final TextStyle definitionStyle = TextStyle(fontWeight: FontWeight.bold);

  bool _isNotNull(subject) => (subject != null);

  TextSpan _buildSection(sectionName) {
    return  _isNotNull(sectionName) ?
      TextSpan(text: '${localizations.section} $sectionName ') :
      TextSpan();
  }

  TextSpan _buildChapter(chapterNumber) {
    return _isNotNull(chapterNumber) ?
      TextSpan(text: '${localizations.chapter} $chapterNumber ') :
      TextSpan();
  }

  TextSpan _buildArticle(articleNumber) {
    return _isNotNull(articleNumber) ?
      TextSpan(text: '${localizations.article} $articleNumber ') :
      TextSpan();
  }

  TextSpan _buildParagraph(paragraphNumber) {
    return _isNotNull(paragraphNumber) ?
      TextSpan(text: '${localizations.paragraph} $paragraphNumber ') :
      TextSpan();
  }

  TextSpan _buildSubParagraph(subParagraphName) {
    return _isNotNull(subParagraphName) ?
      TextSpan(text: '${localizations.subParagraph} $subParagraphName) ') :
      TextSpan();
  }

  TextSpan _buildPart(partNumber) {
    return _isNotNull(partNumber) ?
      TextSpan(text: '${localizations.part} $partNumber ') :
      TextSpan();
  }

  TextSpan _buildSentence(sentenceNumber) {
    return _isNotNull(sentenceNumber) ?
    TextSpan(text: '${localizations.sentence} $sentenceNumber ') : TextSpan();
  }

  Widget _buildSourceOfAmendment(String title, Amendment amendment) {
    return (amendment != null) ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '$title: ', style: definitionStyle),
                  _buildSection(amendment.sectionName),
                  _buildChapter(amendment.chapterNumber),
                  _buildArticle(amendment.articleNumber),
                  _buildParagraph(amendment.paragraphNumber),
                  _buildSubParagraph(amendment.subParagraphName),
                  _buildPart(amendment.partNumber),
                  _buildSentence(amendment.sentenceNumber)
                ]
            )
        ),
        //Text('Перемещено в:', style: definitionStyle)
      ],
    ) : Container();
  }

  String _getOperationName() {
    switch(amendment.operation) {
      case AmendmentOperation.ADDED: return localizations.added;
      case AmendmentOperation.CHANGED: return localizations.changed;
      case AmendmentOperation.REMOVED: return localizations.removed;
      case AmendmentOperation.RENAMED: return localizations.renamed;
      case AmendmentOperation.REPLACED: return localizations.replaced;
      default: return '';
    }
  }

  Widget _buildPublishingSource() {
    return (amendment.publishedIn != null) ?
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '${localizations.publishedIn}: ', style: definitionStyle),
            TextSpan(text: '${amendment.publishedIn}'),
          ]
        )
      )
        :
      Container();
  }

 Widget _buildHeader(BuildContext context) {
   SettingsModel settings = Provider.of<SettingsModel>(context);
   String languageCode;
   if (settings.locale != null) {
     languageCode = settings.locale.languageCode;
   } else {
     languageCode = Localizations.localeOf(context).languageCode;
   }
   languageCode = languageCode == 'md' ? 'ro' : languageCode;
   DateTime date = DateTime.parse(amendment.lawDateFrom);
   String formattedDate = DateFormat.yMMMMd(languageCode).format(date);
    return ListTile(
      title: Text(
        '${localizations.law} ${amendment.lawNumber}',
        style: Theme.of(context).textTheme.title),
      subtitle: Text(
        '${localizations.from} ${formattedDate}',
        style: Theme.of(context).textTheme.subtitle,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSourceOfAmendment(localizations.replacedTo, amendment.replacedFrom),
            _buildSourceOfAmendment(_getOperationName(), amendment),
            _buildPublishingSource()
          ],
        ),
        padding: const EdgeInsets.all(16.0)
    );
  }

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context).amendmentCard;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(context),
          CustomDivider(),
          _buildBody(context)
        ],
      )
    );
  }
}