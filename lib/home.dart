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
    );
  }
}
