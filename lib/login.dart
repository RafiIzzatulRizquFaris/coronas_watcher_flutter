import 'package:coronaswatcherflutter/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}

class LoginScreen extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hello, \nWelcome back",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputEmail(),
                      inputPassword(),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Bottom'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  inputEmail() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        autofocus: true,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.lightBlueAccent,
          labelText: "Email",
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  inputPassword() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  buttonLogin() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: 60,
        left: 40,
        right: 40,
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Home();
          }));
        },
        color: Colors.blue,
        height: 40,
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  buttonRegister() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
