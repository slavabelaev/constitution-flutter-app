import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../l10n/app_localizations.dart';
import 'app_bottom_navigation_bar_localizations.dart';

class AppBottomNavigationBar extends StatefulWidget {
  AppBottomNavigationBar({this.onIndexChange});

  final void Function(int currentIndex) onIndexChange;

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  int _selectedIndex = 0;

  AppBottomNavigationBarLocalizations get localizations =>
      AppLocalizations.of(context).bottomNavigationBar;

  void handleTap(int selectedIndex) {
    setState(() { _selectedIndex = selectedIndex; });
    widget.onIndexChange(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (selectedIndex) =>  handleTap(selectedIndex),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.bookOutline),
              activeIcon: Icon(MdiIcons.book),
              title: Text(localizations.byTopic)
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.fileDocumentBoxMultipleOutline),
              activeIcon: Icon(MdiIcons.fileDocumentBoxMultiple),
              title: Text(localizations.articles)
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.bookmarkMultipleOutline),
              activeIcon: Icon(MdiIcons.bookmarkMultiple),
              title: Text(localizations.bookmarks)
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.pencilOutline),
              activeIcon: Icon(MdiIcons.pencil),
              title: Text(localizations.amendments)
          ),
        ],
      )
    );
  }
}