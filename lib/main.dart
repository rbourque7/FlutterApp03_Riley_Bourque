import 'package:flutter/material.dart';
import 'package:FlutterApp03_Riley_Bourque/pages/homepage.dart';

void main() => runApp(
      MyTabbedScopedModelAssignment(),
    );

class MyTabbedScopedModelAssignment extends StatelessWidget {
  final Color themeColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Home',
      theme: ThemeData.light().copyWith(
        brightness: Brightness.light,
        accentColor: Colors.cyan[600],
        primaryColor: themeColor,
        scaffoldBackgroundColor: themeColor,
        indicatorColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 200,
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

         home: MyTabbedScopedModelProject03(
         title: 'Store Home',
      ),
    );
  }
}
