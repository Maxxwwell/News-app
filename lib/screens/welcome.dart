import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/bottom_navigation.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Carousel(
                autoplayDuration: Duration(seconds: 10),
                dotSize: 4,
                dotColor: Theme.of(context).accentColor,
                dotBgColor: Colors.transparent,
                dotSpacing: 10,
                dotVerticalPadding: 5,
                dotPosition: DotPosition.bottomRight,
                images: [
                  Image.asset("assets/images/pr.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/nw.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/pol.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/n6.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/news8.jpg", fit: BoxFit.contain),
                  Image.asset("assets/images/news9.jpg", fit: BoxFit.contain),
                  Image.asset("assets/images/news10.jpg", fit: BoxFit.contain),
                  Image.asset("assets/images/nws.jpg", fit: BoxFit.cover),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              "Get important News from all over the world",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: BottomTabs(),
                      type: PageTransitionType.rightToLeft),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.grey[800],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
