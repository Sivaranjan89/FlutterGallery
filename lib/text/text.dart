import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewText extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewText> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Text'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Flexible( //Wrap the Text Component in Flexible to auto wrap text else it will overflow
              child: Text('This is a Text Component that shows text to the user and has no action associated with it.',
                style: TextStyle( //Text Styling can be done here
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSiFRAsO0CeVLq6RbHp5SCmzqgOmZ6QgWqL5uWhSZG7RBBlT5nXWqbkkgpdOXpcVrBCQD5NSYPHXAOh/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
