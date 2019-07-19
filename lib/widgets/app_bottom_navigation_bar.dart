import 'package:flutter/material.dart';

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
    return BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: handleTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text('Содержание')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subject), title: Text('Все статьи')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              activeIcon: Icon(Icons.favorite),
              title: Text('Избраные')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Поиск')
          ),
        ]
    );
  }
}