import 'package:coronaswatcherflutter/ui/mainpage/account.dart';
import 'package:coronaswatcherflutter/ui/mainpage/dashboard.dart';
import 'package:coronaswatcherflutter/ui/mainpage/feed.dart';
import 'package:coronaswatcherflutter/ui/mainpage/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreen();
  }
}

class HomeScreen extends State<Home> {

  List<Widget> _mainPage = [Dashboard(), Feed(), News(), Account(),];
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "corona".toUpperCase(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "watcher".toUpperCase(),
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.accessibility,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(child: _mainPage[_selectedPage]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedPage,
            onTap: (index){
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: Text("Dashboard"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                title: Text("Feed"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.art_track),
                title: Text("News"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
