import 'package:authentification/Login.dart';
import 'package:authentification/Logout.dart';
import 'package:authentification/QRGenerator.dart';
import 'package:authentification/SignUp.dart';
import 'package:authentification/main.dart';
import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
import 'package:authentification/PaymentPage.dart';
import 'package:authentification/Logout.dart';
import 'package:authentification/DestinationPage.dart';

class SideDrawer extends MyApp {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Quick Access',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          ListTile(
            leading: Icon(Icons.how_to_reg),
            title: Text('Register'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          ListTile(
            leading: Icon(Icons.departure_board),
            title: Text('Destination'),
            onTap: () {Navigator.push(
                context, MaterialPageRoute(builder: (context) => DestinationPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Payment'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code_sharp),
            title: Text('QR_Code'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRGenerator()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: ()  {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Logout()));},
          ),
          Expanded(
            child: Container(
              width: 100,
            ),
          ),
          Container(
            height: 20,
            child: Image(
              image: AssetImage("images/made.jpg"),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
