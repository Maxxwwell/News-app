import 'package:flutter/material.dart';
import 'package:news_app/screens/TabPages/entertainment.dart';
import 'package:news_app/screens/TabPages/health.dart';
import 'package:news_app/screens/TabPages/politics.dart';
import 'package:news_app/screens/TabPages/sports.dart';
import 'package:news_app/screens/TabPages/technology.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "News from all over the world",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  child: Column(
                    children: [
                      TabBar(
                          controller: _tabController,
                          enableFeedback: true,
                          indicatorColor: Colors.black,
                          indicatorWeight: 2,
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(
                              child: Text(
                                "Politics",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Sports",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Entertainment",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Technology",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Health",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: double.infinity,
                          child: TabBarView(
                              controller: _tabController,
                              children: [
                                Politics(),
                                Sports(),
                                Entertainment(),
                                Technology(),
                                Health()
                              ]),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
