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
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            accountSection(),
//            profileSection(),
          ],
        ),
      ),
    );
  }

  accountSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 5,
              top: 10,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Max Verstappen",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "your cRaSh",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icon-angle-right.png",
                        color: Colors.black,
                        width: 20,
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
