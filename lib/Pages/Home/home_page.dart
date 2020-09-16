import 'dart:developer';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:green_field/Models/BanAn.dart';

import 'package:green_field/Pages/Login/login_page.dart';
import 'package:green_field/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fancy Bottom xxxx"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(2);
              }),
          TabData(iconData: Icons.group_work, title: "Order"),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Text("Hello"), Text("World")],
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return _getOrderPage();
      case 1:
        return _getOrderPage();
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}

List<BanAn> banan = <BanAn>[
  BanAn("Item No 1", true),
  BanAn("Item No 2", true),
  BanAn("Item No 3", false),
  BanAn("Item No 4", true),
  BanAn("Item No 5", true),
  BanAn("Item No 6", false),
  BanAn("Item No 7", true),
  BanAn("Item No 8", true),
  BanAn("Item No 9", true),
  BanAn("Item No 10", true)
];
Widget _getOrderPage() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return _buildRowOrder(index);
    },
    itemCount: banan.length,
  );
}

Widget _buildRowOrder(int index) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: banan[index].status ? kPrimaryLightColor : kPrimaryColor),
      child: Column(
        children: <Widget>[
          Text(banan[index].tenBan),
          Text(""),
        ],
      ),
    ),
    onTap: () => {log("item tapped")},
  );
}
