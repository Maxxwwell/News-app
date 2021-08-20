import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'breaking_news_details.dart';

const apiKey = 'c564cffba3344a0b9c0ef9ea3186719f';
var today = DateFormat('yMd').format(DateTime.now());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var breakingNews;
  var articlesLength;
  // var date;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDate();
    setState(() {
      isLoading = true;
    });
    print('loading');
    getNews();
  }

  @override
  void dispose() {
    isLoading = null;
    super.dispose();
  }

  void getDate() {
    print(today);
  }

  Future getNews() async {
    try {
      http.Response response = await http.get(
        "https://newsapi.org/v2/everything?q=news&from=$today&to=$today&sortBy=popularity&apiKey=$apiKey",

        // https://newsapi.org/v2/everything?q=news&from=2021-08-02&to=2021-08-02&sortBy=popularity&apiKey=c564cffba3344a0b9c0ef9ea3186719f#
      );
      if (response.statusCode == 200) {
        breakingNews = response.body;

        // date = jsonDecode(breakingNews)['articles']['publishedAt'];

        setState(() {
          articlesLength = jsonDecode(breakingNews)['articles'];
          print(articlesLength.length);
        });
      }
      print(response);
      setState(() {
        isLoading = false;
        print("finished loading");
      });
    } catch (e) {
      print(e);
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "An error occured, check your connection and try again",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 28,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/brkn.gif',
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breaking News",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                    itemCount:
                        articlesLength == null ? 0 : articlesLength.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.55,
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: BreakingNewsDetails(
                            //<_
                            title: jsonDecode(breakingNews)['articles'][index]
                                ['title'],
                            image: jsonDecode(breakingNews)['articles'][index]
                                ['urlToImage'],
                            content: jsonDecode(breakingNews)['articles'][index]
                                ['content'],
                            description: jsonDecode(breakingNews)['articles']
                                [index]['description'],
                            publishedAt: jsonDecode(breakingNews)['articles']
                                [index]['publishedAt'],
                            source: jsonDecode(breakingNews)['articles'][index]
                                ['source']['name'],
                            author: jsonDecode(breakingNews)['articles'][index]
                                ['author'],
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/lo.gif',
                                  image: jsonDecode(breakingNews)['articles']
                                      [index]['urlToImage'],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              jsonDecode(breakingNews)['articles'][index]
                                  ['title'],
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 3),
                            Text(DateTime.parse(
                                        jsonDecode(breakingNews)['articles']
                                            [index]['publishedAt'])
                                    .hour
                                    .toString() +
                                " hours ago"),
                            Text("source: " +
                                jsonDecode(breakingNews)['articles'][index]
                                    ['source']['name']),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
