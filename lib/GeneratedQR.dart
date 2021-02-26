import 'package:authentification/Logout.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:authentification/HomePage.dart';
import 'package:authentification/Logout.dart';
class GeneratedQR extends StatefulWidget {
  final myQR;

  const GeneratedQR(this.myQR);

  @override
  _GeneratedQRState createState() => _GeneratedQRState();
}

class _GeneratedQRState extends State<GeneratedQR> {
  navigateToLogout() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Logout()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated QR "),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QrImage(
              data: widget.myQR,
              version: QrVersions.auto,
              size: 5000.0,
              gapless: false,
            ),
          ),
          SizedBox(height: 50),
          RaisedButton(
            padding: EdgeInsets.only(left: 30, right: 30),
            onPressed: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Alert Dialog Box"),
                  content: Text("Your QR is now stored to Galary"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Close"),
                    ),
                  ],
                ),
              );
            },

            child: Text(
              'SAVE',
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
          SizedBox(width: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToLogout,
                  child: Text(
                    'You can now Proceed to Logout',
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
              SizedBox(width: 0.0),

            ],
          ),
        ],
        ),
      ),
    );
  }
}
