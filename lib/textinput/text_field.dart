import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewTextField extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewTextField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'TextField'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap( //This layout works like a linear layout and allows us to space the components evenly
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10, //This will give 10 spacing between each element in this layout
            direction: Axis.vertical, //This will render the elements in the direction pecified
            children: <Widget>[ //Use Sized box to wrap textfield else input decoration will not render
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'Simple TextField'))),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration.collapsed(hintText: 'TextField without Uderline'))),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'Password TextField'), obscureText: true)),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'Expanding TextField'), maxLines: null)),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'Capitalized TextField'), textCapitalization: TextCapitalization.characters)),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'Floating TextField', alignLabelWithHint: true))),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'TextField with Helper Text', helperText: 'Helper Text'))),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'Prefix Icon TextField', prefixIcon: Icon(Icons.assignment_ind, color: Colors.black, size: 30)))),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(hintText: 'Suffix Icon TextField', suffixIcon: Icon(Icons.assignment_ind, color: Colors.black, size: 30)))),
              SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'Outline TextField', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
            ]
          )
        )
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vQoPmJaI56tAJ4jyaO_kelKWgGLbMfr7jgMmxFHzuWh24ZD41H05Hle9R5y1HodLT84QENSamr1TQhE/pub',
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
