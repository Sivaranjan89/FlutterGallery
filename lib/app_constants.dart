
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApplicationConstants {
  static final String MODAL_SHEET = 'https://docs.google.com/document/d/e/2PACX-1vTXZK78oW7AtN_dTHKDkpRVyQK53vnqbOSuHthsyQTOBJTyk2Qd9ZufUyEBijMtJNlsozTrII8C6Arl/pub';


  static Color appBlue = Color(0xff23E4F9);

  static WebViewController _myController;
  static WebView getWeb(String link) {
    return WebView(
      initialUrl: link,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller){ _myController = controller; },
      onPageFinished: (url) {
        _myController.evaluateJavascript("javascript:(function() { " +
            "document.getElementById('footer').style.display='none';})()");
      },
    );
  }


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