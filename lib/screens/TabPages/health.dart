import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/screens/home/health_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

const apiKey = 'c564cffba3344a0b9c0ef9ea3186719f';
var today = DateFormat('yMd').format(DateTime.now());

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  var healthNews;
  var articlesLength;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDate();
    setState(() {
      isLoading = true;
    });
    print("loading");
    getHealth();
  }

  @override
  void dispose() {
    isLoading = null;
    super.dispose();
  }

  void getDate() {
    print(today);
  }

  Future getHealth() async {
    http.Response response = await http.get(
      "https://newsapi.org/v2/everything?q=health&from=$today&to=$today&sortBy=popularity&apiKey=$apiKey",
      // https://newsapi.org/v2/everything?q=health&from=2021-08-02&to=2021-08-02&sortBy=popularity&apiKey=c564cffba3344a0b9c0ef9ea3186719f
    );

    if (response.statusCode == 200) {
      healthNews = response.body;

      setState(() {
        articlesLength = jsonDecode(healthNews)['articles'];
        print(articlesLength.length);
      });
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
      inAsyncCall: isLoading,
      color: Colors.white,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemCount: articlesLength == null ? 0 : articlesLength.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageTransition(
                child: HealthDetails(
                  title: jsonDecode(healthNews)['articles'][index]['title'],
                  image: jsonDecode(healthNews)['articles'][index]
                      ['urlToImage'],
                  content: jsonDecode(healthNews)['articles'][index]['content'],
                  description: jsonDecode(healthNews)['articles'][index]
                      ['description'],
                  publishedAt: jsonDecode(healthNews)['articles'][index]
                      ['publishedAt'],
                  source: jsonDecode(healthNews)['articles'][index]['source']
                      ['name'],
                  author: jsonDecode(healthNews)['articles'][index]['author'],
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
                      image: jsonDecode(healthNews)['articles'][index]
                                  ['urlToImage'] ==
                              null
                          ? 'assets/images/lo.gif'
                          : jsonDecode(healthNews)['articles'][index]
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
                        jsonDecode(healthNews)['articles'][index]['title'],
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
                                  jsonDecode(healthNews)['articles'][index]
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
