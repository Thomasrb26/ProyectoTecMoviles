import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/screens.dart';
import 'package:flutter_demo/services/actividad_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ActividadService())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALERTASAPP',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
        'activities': (_) => ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.deepPurple,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple, elevation: 0),
      ),
    );
  }
}
