import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => Welcome(),
            ),
            (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.white,
          child: Image.asset('assets/images/L1.gif',
          fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
