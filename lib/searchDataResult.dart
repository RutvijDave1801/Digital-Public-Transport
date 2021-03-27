
import 'package:authentification/PaymentPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:authentification/DestinationHome.dart';
class SearchDataResult extends StatelessWidget {
  BuildContext context;

  navigateToDestination() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationHome()));
  }

  final String source;
  final String destination;
  final String number;

  SearchDataResult({this.source, this.destination, this.number});

  @override

  Widget build(BuildContext context) {
    navigateToDestination() async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationHome()));
    }

    navigateToPayment() async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Transport"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(

            textColor: Colors.black,
            onPressed: navigateToDestination,
            child: Text("Undo"),

            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Text(source),
          // Text(destination),
          // Text(number),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("routes")
                .where("From", isGreaterThanOrEqualTo: source)
                // .where("To", isGreaterThanOrEqualTo: destination)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading Data");
              }
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 700,
                      child: ListView(
                        children: snapshot.data.docs.map<Widget>((document) {
                          Map<String, dynamic> data = document.data();
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            width: 200,
                            // height: 100,
                            child: GestureDetector(
                              onTap: () {
                                final snackBar = SnackBar(
                                  content: Text('Finally! You selected your destination!'),
                                  action: SnackBarAction(
                                    label: 'Proceed',
                                    textColor: Colors.blue,
                                    onPressed: navigateToPayment,
                                  ),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                print(data['To']);
                              },
                              child: Card(
                                  elevation: 3.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("From: " + data['From']),
                                          Text("Destination: " +data['To']),
                                          Text("Route Length: " +data['Route_Length']),
                                          Text("Depot Code: " +data['Depot']),
                                          Text("Route Number: " +data['Route_no']),
                                        ],
                                      ),
                                    ),
                                  )
                                  // ListTile(
                                  //   title: Text(data['From']),
                                  //   subtitle: Text(data['To']),
                                  // ),
                                  ),
                            ),

                          );
                        }).toList(),
                      ),

                    ),
                  );
                }
              } else {
                return Text("Loading");
              }
              return Text("Working");
            },

          ),

        ],

      ),

    );
  }
}
