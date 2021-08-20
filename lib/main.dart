import 'package:flutter/material.dart';
import 'package:news_app/screens/bottom_navigation.dart';
import 'package:news_app/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Atiga",
        primaryColor: Colors.white,
        accentColor: Colors.grey[900],
      ),
      routes: {'/': (context) => SplashScreen(),
      '/home': (context) => BottomTabs()
      },

    );
  }
}
