import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:js' as js;

// ignore: missing_js_lib_annotation
@JS('startHelpSupportFlow')
external void _startHelpSupportFlow(screenType);

@JS('startMpin')
external void _startMpin();

@JS('isNetworkAvailable')
external void _isNetworkAvailable();

class FirstScreen extends StatefulWidget {
  static const routeName = '/first_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var msg = "Network availability status not fetched yet!";

  @override
  void initState() {
    js.context['mpinStatus'] = (status) {
      setState(() {
       // msg = status.toString();
      });
    };
    js.context['networkAvailabilityStatus'] = (status) {
      setState(() {
         msg = status.toString();
      });
    };
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
            onPressed: () {
              _startHelpSupportFlow("Chat Screen");
            },
            child: Text('Start Help Support Flow'),
          ),
          RaisedButton(
            onPressed: () {
              //_startMpin();
              _isNetworkAvailable();
            },
            child: Text('Get Network Status'),
          ),
          Text(msg),
        ],
      )
    );
  }
}