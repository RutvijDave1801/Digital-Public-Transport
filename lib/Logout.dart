import 'package:authentification/SideDrawer.dart';
import 'package:authentification/Start.dart';
import 'package:flutter/material.dart';

import 'package:authentification/Login.dart';
import 'SignUp.dart';

class Logout extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Logout> {
  navigateToHome() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            //SizedBox(height: 5.0),
            Container(
              height: 400,
              child: Image(
                image: AssetImage("images/thanks.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),

            RichText(
                text: TextSpan(
                    text: 'Thanks For  ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Checking IN',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange))
                    ])),
            SizedBox(height: 10.0),
            Text(
              'One step for you daily transportation needs',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 150.0),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToHome,
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange),
                SizedBox(width: 20.0),

              ],
            ),
            SizedBox(width: 30.0),
            Container(
              height: 20,
              child: Image(
                image: AssetImage("images/made.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            //SizedBox(height: 20.0),
            //SignInButton(
            // Buttons.Google,
            // text: "Sign up with Google",
            //onPressed: () {},
            //)
          ],
        ),
      ),
    );
  }
}
