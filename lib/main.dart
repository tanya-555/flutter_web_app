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
  js.context['propertiesFromNative'] = (hostname, token, customerId) {
    Constants.token = token;
    Constants.hostname = hostname;
    Constants.custId = customerId;
  };
  // js.context['functionFromNative'] = (value) {
  //  // return flutterWeb;
  //   //getMpinStatus();
  //   if(value) {
  //     return "yes";
  //   } else {
  //     return "no";
  //   }
  //
  // };
  runApp(MyApp());
}

@JS('getMpinStatus')
external bool getMpinStatus();

@JS('getString')
external String _getString();

@JS('sendSeamlessLoginRequest')
external void _sendSeamlessLoginRequest();

class MyApp extends StatelessWidget {

  Map<String,String> fetchedStringMap = {};
  String fetchedString='';

  Future<void> _initNativeProperties() async {
    _sendSeamlessLoginRequest();
    //_sendSeamlessLoginRequest();
    // Future<void> seamlessLoginFuture = _seamlessLoginFuture();
    // //Future<void> nativePropertiesFuture = _getNativePropertiesFuture();
    // Future<void> validateTokenFuture = _getValidateTokenFuture();
    // FutureGroup futureGroup = FutureGroup();
    // futureGroup.add(seamlessLoginFuture);
    // //futureGroup.add(nativePropertiesFuture);
    // futureGroup.add(validateTokenFuture);
    // futureGroup.close();
    //fetchedStringMap = _getStringMap();
    //fetchedString = _getString();
    //  _sendSeamlessLoginRequest();
    // js.context['propertiesFromNative'] = (hostname, token, customerId) {
    //
    // };
  }
  
  Future<void> _seamlessLoginFuture() async {
    _sendSeamlessLoginRequest();
  }
  
  // Future<void> _getNativePropertiesFuture() async {
  //   js.context['propertiesFromNative'] = (hostname, token, customerId) {
  //     this.token = token;
  //     hostName = hostname;
  //     custId = customerId;
  //   };
  // }

  Future<void> _getValidateTokenFuture() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      String authToken = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<void>(
          future: _initNativeProperties(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.done :
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text('Welcome to Flutter App',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Container(
                          child: Text( Constants.token,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                          ),
                      ),
                    ],
                  ),
                );
              default :
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}



