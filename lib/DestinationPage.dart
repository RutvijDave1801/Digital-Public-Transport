import 'package:authentification/PaymentPage.dart';
import 'package:flutter/material.dart';

class DestinationPage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<DestinationPage> {


  navigateToPayment() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            //SizedBox(height: 5.0),
            Container(
              height: 400,
              child: Image(
                image: AssetImage("images/reach.jpg"),
                fit: BoxFit.contain,
              ),
            ),


            SizedBox(height: 190.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToPayment,
                    child: Text(
                      'Destination Selected',
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
