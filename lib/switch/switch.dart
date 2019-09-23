import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSwitch extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSwitch> {

  var _value = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Switch'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Transform.scale( //Use this to increase the Size of a Widget
        scale: 3,
        child: Switch( //Switch Component
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

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vRwDpndsm9D2_2gjGrjoGjLe9JFowVYWqykLrSb3j-u3DhbAAQDRmEiEGnVit1dAvUDlFghTgZBMv5V/pub',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller){ _myController = controller; },
      onPageFinished: (url) {
        _myController.evaluateJavascript("javascript:(function() { " +
            "document.getElementById('footer').style.display='none';})()");
      },
    );
    Dialog dialog = ApplicationConstants.getCodeDialog(webView);
    showDialog(context: context, builder: (context) => dialog);
  }
}
