import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewBottomSheet extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewBottomSheet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'BottomSheet'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: FlatButton(
          padding: EdgeInsets.all(15),
          child: Text('Click Floating Button to show Bottom Sheet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
          shape: OutlineInputBorder(),
        )
      ),
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSheetUp = false;
  var bottomSheetController;
  void showCode() {
    if(isSheetUp) {
      Navigator.pop(context);
    } else {
      WebView webView = ApplicationConstants.getWeb(ApplicationConstants.MODAL_SHEET);
      bottomSheetController = _scaffoldKey.currentState.showBottomSheet((context) => Container(
          height: 600,
          child: webView
      ), shape: OutlineInputBorder());

      bottomSheetController.closed.then((value) {
        if(isSheetUp) {
          isSheetUp = false;
        }
      });
    }
    isSheetUp = !isSheetUp;
  }



}
