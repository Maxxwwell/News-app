import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/screens/home/entertainment_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// https://newsapi.org/v2/everything?q=entertainment&from=2021-08-02&to=2021-08-02&sortBy=popularity&apiKey=c564cffba3344a0b9c0ef9ea3186719f

const apiKey = 'c564cffba3344a0b9c0ef9ea3186719f';
var today = DateFormat('yMd').format(DateTime.now());

class Entertainment extends StatefulWidget {
  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  var entertainmentNews;
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
    getEntertainment();
  }

  @override
  void dispose() {
    isLoading = null;
    super.dispose();
  }

  void getDate() {
    print(today);
  }

  Future getEntertainment() async {
    http.Response response = await http.get(
      "https://newsapi.org/v2/everything?q=entertainment&from=$today&to=$today&sortBy=popularity&apiKey=$apiKey",
    );

    if (response.statusCode == 200) {
      entertainmentNews = response.body;

      setState(() {
        articlesLength = jsonDecode(entertainmentNews)['articles'];
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
              child: EntertainmentDetails(
                title: jsonDecode(entertainmentNews)['articles'][index]
                    ['title'],
                image: jsonDecode(entertainmentNews)['articles'][index]
                    ['urlToImage'],
                content: jsonDecode(entertainmentNews)['articles'][index]
                    ['content'],
                description: jsonDecode(entertainmentNews)['articles'][index]
                    ['description'],
                publishedAt: jsonDecode(entertainmentNews)['articles'][index]
                    ['publishedAt'],
                source: jsonDecode(entertainmentNews)['articles'][index]
                    ['source']['name'],
                author: jsonDecode(entertainmentNews)['articles'][index]
                    ['author'],
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
                      image: jsonDecode(entertainmentNews)['articles'][index]
                          ['urlToImage'] ==
                              null
                          ? 'assets/images/lo.gif'
                          : jsonDecode(entertainmentNews)['articles'][index]
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
                        jsonDecode(entertainmentNews)['articles'][index]
                            ['title'],
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
                            DateTime.parse(jsonDecode(entertainmentNews)[
                                        'articles'][index]['publishedAt'])
                                    .hour
                                    .toString() +
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
