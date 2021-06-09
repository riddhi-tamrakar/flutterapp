import 'package:app/src/modules/home/ui/home.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar_widget.dart';
import 'message.dart';

class MainPage extends StatefulWidget {
  // final int currentIndex;
  MainPage({
    Key key,
    // this.currentIndex,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<MainPage> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Widget> _children(context) => [
        HomePage(),
        MessagePage(),
      ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        key: _drawerKey,
        body: Column(
          children: [
            Expanded(child: _children(context)[currentIndex]),
          ],
        ),
        bottomNavigationBar: FABBottomAppBar(
          color: Colors.grey,
          selectedColor: Theme.of(context).primaryColor,
          currentIndex: currentIndex,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: onTabTapped,
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
            FABBottomAppBarItem(iconData: Icons.message, text: 'Message'),
          ],
        ),
      ),
    );
  }
}
