import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountScreen();
  }
}

class AccountScreen extends State<Account> {
  List<String> _listProfileLeading = [
    "assets/icon-edit-profile.png",
    "assets/icon-change-pw.png",
  ];
  List<String> _listRegionalLeading = [
    "assets/icon-language.png", "assets/icon-logout.png",
  ];
  List<String> _listProfileTitle = ["Edit Profile", "Change Password"];
  List<String> _listRegionalTitle = ["Language", "Logout"];
  List<Color> _listProfileLeadingColor = [Color(0xffFFA918), Color(0xff00AFFA)];
  List<Color> _listRegionalLeadingColor = [Color(0xff038CC7), Color(0xffFF0000)];

  bool isNotified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            accountSection(),
            profileSection(),
            notificationSection(),
            regionalSection(),
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
                            "Max Tyler",
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

  profileSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 5,
            ),
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                    _listProfileLeading.length, (index) => profileLists(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  profileLists(int index) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _listProfileLeadingColor[index],
            ),
            width: 40,
            height: 40,
            child: Image.asset(_listProfileLeading[index].toString()),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _listProfileTitle[index].toString(),
                      style: TextStyle(fontSize: 18),
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
          ),
        ],
      ),
    );
  }

  notificationSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notification",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 5,
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00FF6D),
                    ),
                    width: 40,
                    height: 40,
                    child: Image.asset("assets/icon-notification.png"),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Notifications",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        CustomSwitch(
                          activeColor: Color(0xff00AFFA),
                          value: isNotified,
                          onChanged: (value){
                            setState(() {
                              isNotified = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  regionalSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Regional",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 5,
            ),
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                    _listRegionalLeading.length, (index) => regionalLists(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  regionalLists(int index) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _listRegionalLeadingColor[index],
            ),
            width: 40,
            height: 40,
            child: Image.asset(_listRegionalLeading[index].toString()),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _listRegionalTitle[index].toString(),
                      style: TextStyle(fontSize: 18),
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
          ),
        ],
      ),
    );
  }
}
