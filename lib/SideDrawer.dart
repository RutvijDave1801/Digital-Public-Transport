import 'package:authentification/main.dart';
import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
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
              }
          ),
          ListTile(
            leading: Icon(Icons.departure_board),
            title: Text('Destination'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Payment'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.qr_code_sharp),
            title: Text('QR_Code'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
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