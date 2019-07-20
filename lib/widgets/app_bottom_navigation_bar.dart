import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppBottomNavigationBar extends StatefulWidget {
  AppBottomNavigationBar({this.onIndexChange});

  final void Function(int currentIndex) onIndexChange;

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  int _selectedIndex = 0;

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
              title: Text('По темам')
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.fileDocumentBoxMultipleOutline),
              activeIcon: Icon(MdiIcons.fileDocumentBoxMultiple),
              title: Text('Статьи')
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.bookmarkMultipleOutline),
              activeIcon: Icon(MdiIcons.bookmarkMultiple),
              title: Text('Закладки')
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.settingsOutline),
              activeIcon: Icon(MdiIcons.settings),
              title: Text('Настройки')
          ),
        ],
      )
    );
  }
}