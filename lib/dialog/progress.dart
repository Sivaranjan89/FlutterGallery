import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewProgress extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewProgress> {

  double _value = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Progress'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              Text('Refresh Progress Indicator'),
              SizedBox(width: 50),
              RefreshProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Colors.black), strokeWidth: 2),
            ]),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              Text('Indeterminate Circular Progress Indicator'),
              SizedBox(width: 50),
              CircularProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Colors.black), strokeWidth: 5),
            ]),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              Text('Determinate Circular Progress Indicator'),
              SizedBox(width: 50),
              CircularProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Colors.black), strokeWidth: 5, value: _value,),
            ]),

            //LinearProgressIndicator(value: _value, valueColor: AlwaysStoppedAnimation<Color>(Colors.black), backgroundColor: Colors.black),
          ],
        )
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRdAo-UVc2QppUj9LUADtddk1wqz0OOQqcmHtrxAx6LgsVkGus4YWykK9bMr4Rv2t_Qy-85cs6IaESw/pub');
    showDialog(context: context, builder: (context) => dialog);
  }

  void increaseProgress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        if(_value >= 1) {
          _value = 0.0;
        } else{
          _value = _value + .01;
        }
        print('PROGRESS VALUE ::::::::: ' + _value.toString());
        increaseProgress();
      });
    });
  }
}
