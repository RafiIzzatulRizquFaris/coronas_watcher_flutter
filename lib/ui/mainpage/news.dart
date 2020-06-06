import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsScreen();
  }
}

class NewsScreen extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is News Screen"),
      ),
    );
  }
}
