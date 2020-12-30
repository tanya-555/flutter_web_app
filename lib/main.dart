@JS()
library t;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:js' as js;

const String flutterWeb = 'from Flutter';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  js.context['functionFromNative'] = (value) {
   // return flutterWeb;
    //getMpinStatus();
    if(value) {
      return "yes";
    } else {
      return "no";
    }

  };
  runApp(MyApp());
}

@JS('getMpinStatus')
external bool getMpinStatus();

@JS('getString')
external String _getString();

@JS('getStringMap')
external Map<String, String> _getStringMap();

class MyApp extends StatelessWidget {

  Map<String,String> fetchedStringMap = {};
  String fetchedString='';

  Future<void> _initNativeProperties() async {
    //fetchedStringMap = _getStringMap();
    fetchedString = _getString();
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
                          child: Text( fetchedString,
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
                return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}



