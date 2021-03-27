import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:authentification/searchDataResult.dart';

class DestinationHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DestinationHome> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  String source = '';
  String destination = '';
  String number = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destination"),
        centerTitle: true,
      ),
      body:  Column(
        children: <Widget>[


          Expanded(

            child: Image(
              image: AssetImage("images/reach.jpg"),
              fit: BoxFit.contain,
            ),
          ),//Rutvij Dave

          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(labelText: "Source"),
                    onChanged: (value) {
                      setState(() {
                        source = value;
                      });
                      // print(value);
                    },
                  ),
                ),
                Container(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(labelText: "Destination"),
                    onChanged: (value) {
                      setState(() {
                        destination = value;
                      });
                      // print(value);
                    },
                  ),
                ),
                Container(
                  width: 300.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Passenger"),
                    onChanged: (value) {
                      setState(() {
                        number = value;
                      });
                      // print(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              print("pressed");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return SearchDataResult(
                    source: source,
                    destination: destination,
                    number: number,
                  );
                }),
              );
            },
            elevation: 5.0,
            color: Colors.orangeAccent,
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
