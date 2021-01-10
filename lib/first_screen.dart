import 'package:flutter/material.dart';
import 'package:js/js.dart';

// ignore: missing_js_lib_annotation
@JS('startHelpSupportFlow')
external void _startHelpSupportFlow(screenType);

class FirstScreen extends StatelessWidget {
  static const routeName = '/first_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              _startHelpSupportFlow("Chat Screen");
            },
            child: Text('Start Help Support Flow'),
          ),
        ],
      )
    );
  }
}