import 'package:flutter/material.dart';
import 'amendment_card.dart';
import '../classes/amendment.dart';

class AmendmentsListView extends StatelessWidget {
  AmendmentsListView(this.amendments);

  final List<Amendment> amendments;

  @override
  Widget build(BuildContext context) {
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