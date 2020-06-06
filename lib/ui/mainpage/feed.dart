import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FeedScreen();
  }
}

class FeedScreen extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Feed Screen"),
      ),
    );
  }
}
