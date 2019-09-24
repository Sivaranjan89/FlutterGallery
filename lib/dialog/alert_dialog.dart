import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewAlertDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewAlertDialog> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'AlertDialog'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog !'),
          onPressed: () {
            showDialog(context: context, //Create an alert dialog and pass the context
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert'), //The title message for your dialog
                content: Text('This is an Alert Dialog. Display your message to the user here.'), //The message to the user
                actions: <Widget>[ //The clickable buttons in a dialog
                  FlatButton(child: (Text('OK')), onPressed: () {
                    Navigator.pop(context);
                  })
                ],
              );
            });
          },
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vSfw88CU3616Q5Qa5DmQWOwYUS07A0mVX5bXQvYlpuyxMqn3DzD-Jx7WC0uml86k-MqyeZI9dNsvzNT/pub',
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
