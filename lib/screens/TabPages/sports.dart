import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/screens/home/sports_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

const apiKey = 'c564cffba3344a0b9c0ef9ea3186719f';
var today = DateFormat('yMd').format(DateTime.now());

class Sports extends StatefulWidget {
  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  var sportsNews;
  var articles_length;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDate();
    setState(() {
      isLoading = true;
    });
    print("loading");
    getSports();
  }

  @override
  void dispose() {
    isLoading = null;
    super.dispose();
  }

  void getDate() {
    print(today);
  }

  Future getSports() async {
    http.Response response = await http.get(
      "https://newsapi.org/v2/everything?q=sports&from=$today&to=$today&sortBy=popularity&apiKey=$apiKey",

      // "  https://newsapi.org/v2/everything?q=football&apiKey=c564cffba3344a0b9c0ef9ea3186719f",
    );

    if (response.statusCode == 200) {
      sportsNews = response.body;

      setState(() {
        articles_length = jsonDecode(sportsNews)['articles'];
        print(articles_length.length);
      });

      // var decodedData = jsonDecode(sportsNews);

      // var title = decodedData['articles'][0]['title'];
      // var time = decodedData['articles'][0]['publishedAt'];

    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          content: Text(
            "An error occured, check your connection and try again",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    print(response);
    setState(() {
      isLoading = false;
      print("finished loading");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      inAsyncCall: isLoading,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20),
        scrollDirection: Axis.vertical,
        itemCount: articles_length == null ? 0 : articles_length.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageTransition(
                child: SportsDetails(
                  title: jsonDecode(sportsNews)['articles'][index]['title'],
                  image: jsonDecode(sportsNews)['articles'][index]
                      ['urlToImage'],
                  content: jsonDecode(sportsNews)['articles'][index]['content'],
                  description: jsonDecode(sportsNews)['articles'][index]
                      ['description'],
                  publishedAt: jsonDecode(sportsNews)['articles'][index]
                      ['publishedAt'],
                  source: jsonDecode(sportsNews)['articles'][index]['source']
                      ['name'],
                  author: jsonDecode(sportsNews)['articles'][index]['author'],
                ),
                type: PageTransitionType.bottomToTop),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/lo.gif',
                      image: jsonDecode(sportsNews)['articles'][index]
                          ['urlToImage'] ==
                              null
                          ? 'assets/images/lo.gif'
                          : jsonDecode(sportsNews)['articles'][index]
                              ['urlToImage'],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.58,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jsonDecode(sportsNews)['articles'][index]['title'],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.schedule, size: 15, color: Colors.grey),
                          SizedBox(height: 10, width: 10),
                          Text(
                            DateTime.parse(
                                  jsonDecode(sportsNews)['articles'][index]
                                      ['publishedAt'],
                                ).hour.toString() +
                                " hours ago",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
