import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewBottomBarFAB extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewBottomBarFAB> {

  var _selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Bottom Bar FAB'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      body: Center(
        child: Text(''),
      ),

      bottomNavigationBar: BottomAppBar(
        notchMargin: 2,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.android), color: _selected==0?Colors.red:Colors.white, focusColor: Colors.red, iconSize: _selected==0?40:20, onPressed: () {onOptionSelected(0);}),
            IconButton(icon: Icon(Icons.location_on), color: _selected==1?Colors.red:Colors.white, focusColor: Colors.red, iconSize: _selected==1?40:20, onPressed: () {onOptionSelected(1);}),
            IconButton(icon: Icon(Icons.account_box), color: _selected==2?Colors.red:Colors.white, focusColor: Colors.red, iconSize: _selected==2?40:20, onPressed: () {onOptionSelected(2);}),
            IconButton(icon: Icon(Icons.airplanemode_active), color: _selected==3?Colors.red:Colors.white, focusColor: Colors.red, iconSize: _selected==3?40:20, onPressed: () {onOptionSelected(3);}),
          ],
        ),
        color: Colors.black,
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  onOptionSelected(int i) {
    setState(() {
      _selected = i;
    });
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vQm5djWDJlwte7fPg7z00aDAtCEHp9B4m79rY_iW8ErbYDCsCj2FvZMT4Se7Bwr97AmVMXLO60g_FXU/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}