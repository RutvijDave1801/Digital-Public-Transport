import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:authentification/GeneratedQR.dart';
class PaymentPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<PaymentPage> {
  navigateToGenerate() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GeneratedQR(textEditingController.text)));
  }
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Home'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  child: Image(
                    image: AssetImage("images/payment.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                      labelText: "Enter the no of Passenger you want to pay for",

                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      prefixIcon: Icon(
                        Icons.payment,
                      ),
                    ),
                    onEditingComplete: navigate,
                  ),

                ),
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: openCheckout,
                    child: Text(
                      'PAY NOW',
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

                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToGenerate,
                    child: Text(
                      'Generate QR Code Now',
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

              ])),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    textEditingController.addListener(() {
      final String text = textEditingController.text.toLowerCase();
      textEditingController.value = textEditingController.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
    _razorpay.clear();
  }


  void openCheckout() async {
    var options = {
      'key': 'rzp_test_4tUaG73lPfM9LW',
      'amount': num.parse(textEditingController.text)*100,
      'name': 'Transport Cost.',
      'description': 'Fares for destination',
      'prefill': {'contact': '8849214912', 'email': 'rutvijdave74@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS:\n\n\n Once you see this message click on Generate QR now \n\n\n"+response.paymentId, timeInSecForIosWeb: 4,backgroundColor: Colors.orange,toastLength: Toast.LENGTH_LONG);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
  void navigate() {
    print(textEditingController.text);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratedQR(textEditingController.text)));
  }
}
