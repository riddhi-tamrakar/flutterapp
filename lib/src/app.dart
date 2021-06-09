import 'package:app/src/styles/theme.dart';
import 'package:app/src/routes.dart';
import 'package:flutter/material.dart';

import 'modules/home/ui/main_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      home: MainPage(),
      routes: routes,
    );
  }
}
