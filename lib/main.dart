import 'package:flutter/material.dart';
import 'package:provider/constants/my_theme_data.dart';
import 'package:provider/screens/movies_screen.dart';
import 'package:provider/screens/splash_screen.dart';
import 'package:provider/service/init_getit.dart';
import 'package:provider/service/navigation_service.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyThemeData.lightTheme,
      home: const MoviesScreen (),
    );
  }
}
