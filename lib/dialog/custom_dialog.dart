import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewDialog> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Dialog'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Dialog !'),
          onPressed: () {
            showDialog(context: context, //Create an alert dialog and pass the context
            builder: (BuildContext context) {
              return Dialog(
                shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))), //Customize the shape of the dialog
                child: Container( //Build a view like any other screen and display it like a dialog here
                  padding: EdgeInsets.all(15),
                  width: 200,
                  height: 230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Image.asset('assets/images/logo.png', width: 40)]),
                      Text('Dialog Title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, fontFamily: 'londrina')),
                      Container(margin: EdgeInsets.only(top: 15), child: Center(child: Text('This is Dialog Content'))),
                      Container(margin: EdgeInsets.only(top: 25), alignment: Alignment.bottomRight, child: Wrap(direction: Axis.horizontal, children: <Widget>[
                        FlatButton(child: (Text('OK')), onPressed: () {
                          Navigator.pop(context);
                        }),

                        FlatButton(child: (Text('Cancel')), onPressed: () {
                          Navigator.pop(context);
                        })
                      ],)),
                    ],
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vR4xAfrpppTa7KJqw781RFhG9g27EHDVRNwiMwWBZ-qYUSyGoiuel3NUrd9n1AQ3_PwFkzxZDlU_0DG/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
