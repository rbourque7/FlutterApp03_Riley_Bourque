import 'package:flutter/material.dart';
import 'package:FlutterApp03_Riley_Bourque/pages/homepage.dart';

void main() => runApp(
      MyTabbedScopedModelAssignment(),
    );

class MyTabbedScopedModelAssignment extends StatelessWidget {
  final Color themeColor = Color(0xFF808366);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed with Scoped Model Demos',
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
         color: themeColor,
      ),
    );
  }
}
