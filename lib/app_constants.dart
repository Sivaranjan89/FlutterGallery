
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApplicationConstants {
  static Color appBlue = Color(0xff23E4F9);

  static WebViewController _myController;
  static Dialog getCodeDialog(String link) {
    WebView webView = WebView(
      initialUrl: link,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller){ _myController = controller; },
      onPageFinished: (url) {
        _myController.evaluateJavascript("javascript:(function() { " +
            "document.getElementById('footer').style.display='none';})()");
      },
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: webView,
      ),
    );
  }
}