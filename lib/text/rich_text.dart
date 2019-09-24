import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewRichText extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewRichText> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Rich Text'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Flexible( //Wrap the Text Component in Flexible to auto wrap text else it will overflow
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(text: 'This is', style: TextStyle(color: Colors.black)),
                    TextSpan(text: ' RichText ', style: TextStyle(color: Colors.red)),
                    TextSpan(text: 'being BOLD ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'and small ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 8)),
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSYdYnAIsbQ5hj8IZMRi6yAgm_j_1olpgq_ooR8mmwKAsHngkeQ3ec8fdLnG0OiUu_e7MgNn_toq-aw/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
