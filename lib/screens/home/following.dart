import 'package:flutter/material.dart';
import 'package:link/link.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Link couldn't be opened"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular news sites",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  runSpacing: 20,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 15,
                  children: [
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/bbc.JPG",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "BBC News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.bbc.com/news",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
/////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/cnn.JPG",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "CNN News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://edition.cnn.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
//////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/cnbc.JPG",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "CNBC News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.cnbc.com/world/?region=world",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/msn.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "MSN News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.msn.com/en-us/news",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/feedly-logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Feedly News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://feedly.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/sky.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Sky News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://news.sky.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/reuters_.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Reuters",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.reuters.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/Mail.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Mail Online",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url:
                                  "https://www.dailymail.co.uk/home/index.html",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/cna.JPG",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "CNA News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.channelnewsasia.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/google.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Google news",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://news.google.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/fox-news-logo.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Fox News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.foxnews.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
/////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/voa.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "VOA News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.voanews.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
//////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/alj.JPG",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Aljazera",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.aljazeera.com/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
                              "assets/images/joy.jpeg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Joy News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.myjoyonline.com/news/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////////
                    Container(
                      width: 140,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Image.asset(
//<!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11>>
                              "assets/images/geo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Geo News",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[50],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: Link(
                              url: "https://www.geo.tv/",
                              onError: _showErrorSnackBar,
                              child: Text(
                                "Open",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////
                  ],
                ),

//--------------------------------------------------------------//
              ],
            ),
          ),
        ),
      ),
    );
  }
}
