import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../classes/preamble.dart';

class PreambleRoute extends StatelessWidget {
  PreambleRoute(this.preamble, {
    @required this.title
  });

  final Preamble preamble;
  final String title;

  Widget _buildParagraph(paragraph) {
    bool isLast = preamble.paragraphs.last == paragraph;
    return Container(
      child: Text(paragraph),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
    );
  }

  Widget _buildPreamble() {
    List<Widget> _listOfParagraphs = preamble.paragraphs.map(_buildParagraph).toList();
    return Column(
      children: _listOfParagraphs,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Card(
            child: Padding(
                child: _buildPreamble(),
                padding: const EdgeInsets.all(16.0)
            ),
          )
        ],
      ),
    );
  }
}