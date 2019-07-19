import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_model.dart';
import '../widgets/app_search_delegate.dart';

class AppBottomNavigationBar extends StatefulWidget {
  AppBottomNavigationBar({this.onIndexChange});

  final void Function(int currentIndex) onIndexChange;

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  int _selectedIndex = 0;

  void handleTap(int selectedIndex, articles) {
    if (selectedIndex == 3) {
      showSearch(context: context, delegate: AppSearchDelegate(articles));
    }

    setState(() { _selectedIndex = selectedIndex; });
    widget.onIndexChange(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AppModel>(
        builder: (context, app, child) =>
          BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: (selectedIndex) =>  handleTap(selectedIndex, app.articles),
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
        )
    );
  }
}