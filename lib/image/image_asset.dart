import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewImageAsset extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewImageAsset> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Image (Asset)'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Image.asset('assets/images/logo.png', //Load Image from Asset
        color: Colors.red, //Set Color
        width: 300), //Set Width and Height (Setting only Width will maintain proportion and change height accordingly)
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vT5v_GBwWKG69D6VmAeKh9KM7XvpagKdVe0XFsZzcmQZSl-t83206Jsn-r07NZ8oC0HqNzueDmIi6vv/pub',
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
