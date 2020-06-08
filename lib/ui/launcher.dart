import 'dart:async';

import 'package:coronaswatcherflutter/ui/login.dart';
import 'package:flutter/material.dart';

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LauncherScreen();
  }
}

class LauncherScreen extends State<Launcher> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEE892),
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/launcher.gif",
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/corona_logo.png"),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "corona".toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "watcher".toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  startLaunching() {
    var duration = Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Login();
      }));
    });
  }
}
