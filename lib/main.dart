@JS()
library t;

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app/constants.dart';
import 'package:js/js.dart';
import 'dart:js' as js;

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

@JS('closeFlutterView')
external void _closeFlutterView();

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

  @override
  void initState() {
   loginRequest();
    super.initState();
  }


  Future<void> loginRequest()async{
     js.context['propertiesFromNative'] = (token) {
       Constants.token = token;
       setState(() {
         isLoginComplete = true;
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Credit Card'),
        ),
        body: isLoginComplete ?
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text("Token : "+Constants.token)),) :
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text("Loading ...")),)
      ),
    );
  }
}



