import 'package:flutter/material.dart';
import 'package:flutter_app8/presentation/resources/routes_manager.dart';
import 'package:flutter_app8/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {

  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: lightTheme(),
      themeMode: ThemeMode.light,
    );
  }
}
