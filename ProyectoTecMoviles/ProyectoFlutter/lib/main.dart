import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ALERTASAPP',
        initialRoute: 'home',
        routes: {
          'home': (_) => homeScreen(),
          'details': (_) => detailsScreen(),
        },
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(color: Color.fromRGBO(68, 124, 196, 1))));
  }
}
