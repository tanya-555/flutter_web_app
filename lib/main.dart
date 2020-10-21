@JS()
library t;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:js' as js;

const String flutterWeb = 'from Flutter';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  js.context['functionFromNative'] = () {
    return flutterWeb;
  };
  runApp(MyApp());
}

@JS('getString')
external String _getString();

class MyApp extends StatelessWidget {

  String fetchedString;

  Future<void> _initNativeProperties() async {
    fetchedString = _getString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Web App'),
        ),
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
                        child: Text('Welcome to Flutter Web App'),
                      ),
                      Container(
                          child: Text( fetchedString ?? 'String not yet received!')
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



