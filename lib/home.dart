import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreen();
  }
}

class HomeScreen extends State<Home> {
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
      body: Center(
        child: Text(
          "This is Home Screen of Corona Watcher",
        ),
      ),
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
