import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSwitchListTile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSwitchListTile> {

  var _value = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'SwitchListTile'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Transform.scale( //Use this to increase the Size of a Widget
        scale: 1,
        child: SwitchListTile(
          title: Text('Are you enjoying Flutter ?'), //Set the main text
          subtitle: Text('Dont stop here. There is a lot more'), //Set additional Info
          secondary: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ //Using a column to center the image
            Image.asset('assets/images/logo.png', width: 40, color: Colors.black) //Load image as the seconday widget
          ],),
          value: _value, //The Current Selected value (bool)
          activeColor: Colors.black, //When ON the thumb image color
          activeTrackColor: Colors.black, //When ON the path image color
          inactiveTrackColor: Colors.black12, //When OFF the path image color
          inactiveThumbColor: Colors.black12, //When OFF the thumb image color
          onChanged: (value) {
            setState(() {
              _value = value; //Getting the new value
            });
          },)
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTLB4LLB9qf9kdaU3A_3nWVilTW_-uco48kKGYOQPHmM8N7-42uK8yruyGre8yUrVkirPxNXcI2IJkG/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
