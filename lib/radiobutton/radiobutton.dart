import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewRadioButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewRadioButton> {

  var _selectedValue = 0;

  @override
  void initState() {
    super.initState();
    _selectedValue = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'RadioButton'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () {
          showCode();
        },
      ),
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 1,
          children: <Widget>[
            RadioListTile(value: 0, groupValue: _selectedValue, onChanged: (int value) {handleRadioValue(value);}, activeColor: Colors.black, title: Text('Android')),
            RadioListTile(value: 1, groupValue: _selectedValue, onChanged: (int value) {handleRadioValue(value);}, activeColor: Colors.black, title: Text('iOS')),
            RadioListTile(value: 2, groupValue: _selectedValue, onChanged: (int value) {handleRadioValue(value);}, activeColor: Colors.black, title: Text('Flutter')),
          ],
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl:
          'https://docs.google.com/document/d/e/2PACX-1vRTAke-pU1WbPcZJDrVsO55XlQCkO5DvLniV2keWbOFkqRu87Try5ZCqknYFDIK8YxbEbyvQ5U7Bk2B/pub',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        _myController = controller;
      },
      onPageFinished: (url) {
        _myController.evaluateJavascript("javascript:(function() { " +
            "document.getElementById('footer').style.display='none';})()");
      },
    );
    Dialog dialog = ApplicationConstants.getCodeDialog(webView);
    showDialog(context: context, builder: (context) => dialog);
  }

  handleRadioValue(int value) {
    setState(() {
      _selectedValue = value;
    });
  }
}
