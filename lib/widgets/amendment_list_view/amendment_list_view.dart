import 'package:flutter/material.dart';
import 'package:constitution/widgets/amendment_card/amendment_card.dart';
import '../../classes/amendment.dart';
import '../../l10n/app_localizations.dart';
import 'amendment_list_view_localizations.dart';

class AmendmentsListView extends StatelessWidget {
  AmendmentsListView(this.amendments);

  AmendmentListViewLocalizations localizations;
  final List<Amendment> amendments;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context).amendmentListView;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: amendments.length,
      itemBuilder: (context, index) {
        bool isLast = amendments[index] == amendments.last;
        return Padding(
          child: AmendmentCard(amendments[index]),
          padding: EdgeInsets.only(bottom: isLast ? 0 : 16.0)
        );
      }
    );
  }
}