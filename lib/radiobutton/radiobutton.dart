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
  @override
  void initState() {
    super.initState();
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
          direction: Axis.vertical,
          spacing: 10,
          children: createWidgets(), //Lets create 8 checkboxes
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl:
          'https://docs.google.com/document/d/e/2PACX-1vSQ84zAlCl-UVGdIoDXjpV7VE9n8Nk6Jn_70myjbn_ebax-O5gO8j96otZLVHLJa8foRNkyiTLFBcqu/pub',
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

  //To hold the checkbox values
  var checkValues = [false, false, false, false, false, false, false, false];

  List<Widget> createWidgets() {
    List<Widget> widgets = new List();

    for (int i = 0; i < 8; i++) {
      widgets.add(Container(
        width: 220,
        child: CheckboxListTile(
          title: Text('Title ' + i.toString()), //Checkbox Main Text
          subtitle: Text('Subtitle ' + i.toString()), //Checkbox Text below the title
          activeColor: Colors.black, //The color of the checkbox when checked
          checkColor: Colors.white, //The color of the checkbox when checked
          value: checkValues[i], //The state of the checkbox
          secondary: Column( //Lets create an icon / image as the secondary widget
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png',
                  width: 30, color: Colors.black)
            ],
          ),
          onChanged: (bool value) {
            setState(() { //State for the touched checkbox changes with the updated value
              checkValues[i] = !checkValues[i];
            });
          },
        ),
      ));
    }
    return widgets;
  }
}
