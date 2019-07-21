class Amendment extends AmendmentBase {
  final String lawNumber;
  final String lawDateFrom;
  final String publishedIn;
  final AmendmentOperation operation;
  final AmendmentBase replacedFrom;

  Amendment({
    sectionName,
    chapterNumber,
    articleNumber,
    paragraphNumber,
    subParagraphName,
    partNumber,
    sentenceNumber,
    this.lawNumber,
    this.lawDateFrom,
    this.publishedIn,
    this.operation,
    this.replacedFrom
  });
}

enum AmendmentOperation {
  ADDED,
  REMOVED,
  CHANGED,
  RENAMED,
  REPLACED
}

class AmendmentBase {
  final String sectionName;
  final num chapterNumber;
  final num articleNumber;
  final num paragraphNumber;
  final String subParagraphName;
  final num partNumber;
  final num sentenceNumber;

  AmendmentBase({
    this.sectionName,
    this.chapterNumber,
    this.articleNumber,
    this.paragraphNumber,
    this.subParagraphName,
    this.partNumber,
    this.sentenceNumber,
  });
}