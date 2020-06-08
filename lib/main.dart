import 'file:///C:/Users/risqu/AndroidStudioProjects/coronas_watcher_flutter/lib/ui/login.dart';
import 'package:coronaswatcherflutter/ui/launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronas Watcher',
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.white,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      home: Launcher(),
    );
  }
}
