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
    TextStyle _titleStyle = Theme.of(context).textTheme.body1.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0
    );
    Color _iconColor = Theme.of(context).iconTheme.color;
    // TODO: implement build
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (selectedIndex) =>  handleTap(selectedIndex),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.bookOutline,
                color: _iconColor,
              ),
              activeIcon: Icon(
                MdiIcons.book,
                color: _iconColor,
              ),
              title: Text(
                localizations.byTopic,
                style: _titleStyle,
              ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.fileDocumentBoxMultipleOutline,
                color: _iconColor,
              ),
              activeIcon: Icon(
                MdiIcons.fileDocumentBoxMultiple,
                color: _iconColor,
              ),
              title: Text(
                localizations.articles,
                style: _titleStyle,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.bookmarkMultipleOutline,
                color: _iconColor,
              ),
              activeIcon: Icon(
                MdiIcons.bookmarkMultiple,
                color: _iconColor,
              ),
              title: Text(
                localizations.bookmarks,
                style: _titleStyle,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.pencilOutline,
                color: _iconColor,
              ),
              activeIcon: Icon(
                MdiIcons.pencil,
                color: _iconColor,
              ),
              title: Text(
                localizations.amendments,
                style: _titleStyle,
              )
          ),
        ],
      )
    );
  }
}