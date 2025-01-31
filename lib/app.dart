import 'package:flutter/material.dart';

import 'feature/tab_bar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Tabbar(),
    );
  }
}
