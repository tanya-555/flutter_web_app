@JS()
library t;

import 'package:flutter/material.dart';
import 'package:flutter_web_app/constants.dart';
import 'package:flutter_web_app/first_screen.dart';
import 'package:js/js.dart';
import 'dart:js' as js;
import 'dart:convert';

const String flutterWeb = 'from Flutter';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // js.context['propertiesFromNative'] = (hostname, token, customerId) {
  //   Constants.token = token;
  //   Constants.hostname = hostname;
  //   Constants.custId = customerId;
  //   js.context.callMethod('alertMsg', [token]);
  // };
  runApp(MyApp());
}

@JS('getString')
external String _getString();

@JS('getMpinStatus')
external String _getMpinStatus();

@JS('sendPaymentData')
external String _sendPaymentData(paymentData);

@JS('closeCreditCardModule')
external void _closeCreditCardModule();

@JS('sendSeamlessLoginRequest')
external void _sendSeamlessLoginRequest();

@JS('onCreditCardLoginSuccess')
external void _onCreditCardLoginSuccess();

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoginComplete = false;
  String val = "Mpin not verified yet";

  @override
  void initState() {
   loginRequest();
    super.initState();
  }


  Future<void> loginRequest()async{
    js.context['mpinStatus'] = (status) {
      if(status) {
        onMpinAuthenticationSuccess(() {
          setState(() {
            val = "Mpin verification success" + Constants.deviceType.toString();
          });
        });
      }
    };
    js.context['firstTimeLoginStatus'] = (status) {
      setState(() {
        val = status;
      });
    };
     js.context['partnerApplicationData'] = (token, hostname, deviceType, density, deviceModel,
         sdkVersion, osVersion, uuid, partnerVersion, custId) {
       Constants.token = token;
       Constants.hostname = hostname;
       Constants.customerId = custId;
       Constants.deviceType = deviceType;
       validateToken((status) {
         if(status) {
           setState(() {
             _onCreditCardLoginSuccess();
             isLoginComplete = true;
           });
         } else {
           _closeCreditCardModule();
         }
       });
     };
     _sendSeamlessLoginRequest();
  }

  Future<void> validateToken(Function function) async{
    bool status = false;
    Future.delayed(Duration(milliseconds: 1000), () {
      status = true;
      function.call(status);
    });
  }

  Future<void> onMpinAuthenticationSuccess(Function function) async {
    Future.delayed(Duration(milliseconds: 1000), () {
      function.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        FirstScreen.routeName: (context) => FirstScreen(),
      },
      home: Builder(
        builder: (context) =>
        Scaffold(
          appBar: AppBar(
            title: Text('Credit Card'),
          ),
          body: isLoginComplete ?
              _showWidget(context)
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   child: Center(child: Text("Token : "+Constants.hostname)),)
         : Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(child: Text("Loading ...")),)
        ),
      ),
    );
  }

  Widget _showWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          RaisedButton(
            onPressed: () {
              _getMpinStatus();
            },
            child: Text('Start Mpin Flow'),
          ),
          Text(
            val
          ),
          SizedBox(
            height: 80.0,
          ),
          RaisedButton(
            onPressed: () {
              // var paymentMap = new Map();
              // paymentMap.putIfAbsent('abc', () => 'efg');
              // _sendPaymentData(jsonEncode(paymentMap));
              Navigator.of(context).pushNamed(FirstScreen.routeName);
            },
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}



