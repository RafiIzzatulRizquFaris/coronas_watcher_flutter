import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountScreen();
  }
}

class AccountScreen extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Account Screen"),
      ),
    );
  }
}
