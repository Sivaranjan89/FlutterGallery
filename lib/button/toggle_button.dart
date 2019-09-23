import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewToggleButton extends StatefulWidget {

  int value = 0;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewToggleButton> {

  var isSelected1 = [false, false, false];
  var isSelected2 = [false, false, false];
  int selectedItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Toggle Button'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          direction: Axis.vertical,
          children: <Widget>[
            ToggleButtons( //Multi Choice
              isSelected: isSelected1, //Array of boolean values indicating what items are selected
              color: Colors.black, //Color of Widget
              selectedColor: Colors.white, //Selected Color of Widget
              highlightColor: Colors.red, //Color that displays when user holds an item
              borderColor: Colors.black, //Border Color
              selectedBorderColor: Colors.white, //Selected Border Color
              fillColor: Colors.black, //Selected Color for selected Item
              onPressed: (int index) {
                setState(() {
                  isSelected1[index] = !isSelected1[index]; //Update the booleans and reload widget
                });
              },
              children: <Widget>[ //Generate Items
                Text('Android'),
                Text('iOS'),
                Text('Flutter'),
              ],
            ),

            ToggleButtons( //Single Choice
              isSelected: isSelected2, //Array of boolean values indicating what items are selected
              color: Colors.black, //Color of Widget
              selectedColor: Colors.white, //Selected Color of Widget
              highlightColor: Colors.red, //Color that displays when user holds an item
              borderColor: Colors.black, //Border Color
              selectedBorderColor: Colors.white, //Selected Border Color
              fillColor: Colors.black, //Selected Color for selected Item
              onPressed: (int index) {
                setState(() {
                  for(int i=0; i<isSelected2.length; i++) {
                    if(i == index) {
                      isSelected2[i] = !isSelected2[i];
                    } else {
                      isSelected2[i] = false;
                    }
                  }
                });
              },
              children: <Widget>[ //Generate Items
                Text('Android'),
                Text('iOS'),
                Text('Flutter'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vSte1OzBhPtAyhBWmIouDZl5XyMfLhNre53f2o-GEz5Ld4jVXUlZsmgTnBiJlwVIjOD4gOf90q5_7CZ/pub',
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
