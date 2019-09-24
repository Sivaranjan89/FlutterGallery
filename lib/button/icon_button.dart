import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewIconButton extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewIconButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Icon Button'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          direction: Axis.vertical,
          children: <Widget>[
            IconButton(
                icon: Image.asset('assets/images/logo.png'),
                iconSize: 80,
                splashColor: Colors.white,
                onPressed: (){} //Give your action
            ),

            IconButton( //Disabled Icon Button will have no splash effect on click
                icon: Image.asset('assets/images/logo.png', color: Colors.black12),
                iconSize: 80,
                onPressed: null //Give null to disable
            ),

          ],
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRHPDlTmmPCk0D_IFneeD6pCD4HE6BiR1UewLghnbbJ4HqiSEbGKYpCqtDBki5dUGcN3YiKu6CzKCEW/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
