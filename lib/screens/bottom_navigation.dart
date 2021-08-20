import 'package:flutter/material.dart';
import 'package:news_app/screens/home/discover.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:news_app/screens/home/following.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      padding: NavBarPadding.symmetric(horizontal: 1),
      screens: [
        HomePage(),
        DiscoverPage(),
        Following(),
      ],
      backgroundColor: Colors.grey[100],
      items: _navBarItems(),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      itemAnimationProperties: ItemAnimationProperties(
        curve: Curves.ease,
        duration: Duration(microseconds: 300),
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.decelerate,
          duration: Duration(microseconds: 400),
          animateTabTransition: true),
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.house_outlined),
          icon: Icon(Icons.house_rounded),
          title: "Home",
          activeColorPrimary: Theme.of(context).accentColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.explore_outlined),
          icon: Icon(Icons.explore_sharp),
          title: "Discover",
          activeColorPrimary: Theme.of(context).accentColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.link_outlined),
          icon: Icon(Icons.link),
          title: "Links",
          activeColorPrimary: Theme.of(context).accentColor,
          inactiveColorPrimary: Colors.grey)
    ];
  }
}
