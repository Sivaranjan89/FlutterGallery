import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewRaisedButton extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewRaisedButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Raised Button'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          direction: Axis.vertical,
          children: <Widget>[
            RaisedButton(
                color: Colors.white, //Set Background Color
                textColor: Colors.black, //Set Text Color
                child: Text('Raised Button', style: TextStyle(fontSize: 20)), //Style your Text
                onPressed: (){} //Give your action
            ),

            RaisedButton(
                disabledColor: Colors.grey, //Set Disabled Background Color
                disabledTextColor: Colors.black45, //Set Disabled Text Color
                child: Text('Raised Button Disabled', style: TextStyle(fontSize: 20)),
                onPressed: null //Pass null to make the Button as disabled
            ),

            RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Raised Outline Button', style: TextStyle(fontSize: 20)),
                shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.black, width: 2)), //This will provide rounded edges and stroke for Button
                onPressed: () {}
            ),

            RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Row( //Add a custom view to the child element to bring icon and text
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/images/logo.png', width: 50, color: Colors.black), //Loads Image from Assets
                    SizedBox(width: 10, height: 50), //Space Component
                    Text('Raised Icon Button', style: TextStyle(fontSize: 20))
                  ],
                ),
                shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                onPressed: () {}
            ),

          ],
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vRo_ewJekF4MEcd79hD3ah9TXM8OtQJcd3n4GFjxnX0iWMAe6MjUQZ4WuA-Gk_d0qBlWW4yFeP5fmoh/pub',
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
