import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewAnimatedSwitcher extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewAnimatedSwitcher> {

  var _value = false;

  @override
  void initState() {
    super.initState();
    createWidgets();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'AnimatedSwitcher'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(seconds: 1), //Specify the Duration of the animation
              child: isVisible //Check the bool value and load the respective widgets
                  ? _first_widget : _second_widget,
                transitionBuilder: (Widget child, Animation<double> animation) { //Build your custom animation here
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                }
            ),

            RaisedButton(
              child: Text('Animate'),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vTIUQx3-p3UnlhTkiSFqlBsHkWBvqqzJhSrHqgektL69ETF2aaahnVvm9L0W38opLHJc2HQSSwhx-h7/pub',
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

  Widget _first_widget, _second_widget;
  bool isVisible = true;
  createWidgets() {
    _first_widget = Container(
      color: Colors.white,
      height: 300,
      width: 300,
    );

    _second_widget = ClipOval(
      child: Container(
        color: Colors.black,
        height: 300,
        width: 300,
      ),
    );
  }
}
