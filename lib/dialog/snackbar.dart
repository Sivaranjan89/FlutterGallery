import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSnackbar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSnackbar> {

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Snackbar'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: FlatButton(
          child: Text('Click to show Snackbar', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
          shape: OutlineInputBorder(),
          onPressed: () {
            scaffoldState.currentState.showSnackBar(SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(seconds: 1),
              content: Text('Snackbar', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
              action: SnackBarAction(label: 'Hide', textColor: Colors.black, onPressed: () {
                //Giving no Action will hide the snackbar
              }),
            ));
          },
        )
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vT2z7slDwiCMV9QIJysMpV6v6vR7_55-rABrIIxO6pOAjjYstDF2UkIVfseSZIxHNP1GUug6OEeXbtl/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
