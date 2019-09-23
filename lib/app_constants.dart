
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApplicationConstants {
  static Color appBlue = Color(0xff23E4F9);

  static Dialog getCodeDialog(WebView code) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: code,
      ),
    );
  }
}