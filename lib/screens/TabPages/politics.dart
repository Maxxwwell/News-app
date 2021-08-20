import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/screens/home/politics_details.dart';
import 'package:page_transition/page_transition.dart';

import 'package:http/http.dart' as http;

const apiKey = 'c564cffba3344a0b9c0ef9ea3186719f';
var today = DateFormat('yMd').format(DateTime.now());

class Politics extends StatefulWidget {
  @override
  _PoliticsState createState() => _PoliticsState();
}

class _PoliticsState extends State<Politics> {
  var politicsNews;
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
    getPolitics();
  }

  @override
  void dispose() {
    isLoading = null;
    super.dispose();
  }

  void getDate() {
    print(today);
  }

  Future getPolitics() async {
    http.Response response = await http.get(
      "https://newsapi.org/v2/everything?q=politics&from=$today&to=$today&sortBy=popularity&apiKey=$apiKey",

      // https://newsapi.org/v2/everything?q=politics&from=2021-08-02&to=2021-08-02&sortBy=popularity&apiKey=c564cffba3344a0b9c0ef9ea3186719f
    );
    if (response.statusCode == 200) {
      politicsNews = response.body;

      setState(() {
        articlesLength = jsonDecode(politicsNews)['articles'];
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

  // if (response.statusCode == 200) {
  //   politicsNews = response.body;
  //   setState(() {
  //     articlesLength = jsonDecode(politicsNews)['articles'];
  //     print(articlesLength.length);
  //   });
  // }
  // print(response);
  // setState(() {
  //   isLoading = false;
  //   print("finished loading");
  // });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      inAsyncCall: isLoading,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20),
        scrollDirection: Axis.vertical,
        itemCount: articlesLength == null ? 0 : articlesLength.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: PoliticsDetails(
                title: jsonDecode(politicsNews)['articles'][index]['title'],
                image: jsonDecode(politicsNews)['articles'][index]
                    ['urlToImage'],
                content: jsonDecode(politicsNews)['articles'][index]['content'],
                description: jsonDecode(politicsNews)['articles'][index]
                    ['description'],
                publishedAt: jsonDecode(politicsNews)['articles'][index]
                    ['publishedAt'],
                source: jsonDecode(politicsNews)['articles'][index]['source']
                    ['name'],
                author: jsonDecode(politicsNews)['articles'][index]['author'],
              ),
            ),
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
                      image: jsonDecode(politicsNews)['articles'][index]
                          ['urlToImage'] ==
                              null
                          ? 'assets/images/lo.gif'
                          : jsonDecode(politicsNews)['articles'][index]
                              ['urlToImage'],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.58,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        jsonDecode(politicsNews)['articles'][index]['title'],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(height: 10, width: 10),
                          Text(
                            DateTime.parse(jsonDecode(politicsNews)['articles']
                                        [index]['publishedAt'])
                                    .hour
                                    .toString() +
                                " hours ago",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                      )
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
