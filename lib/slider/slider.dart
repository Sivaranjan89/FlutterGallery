import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSlider extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSlider> {

  double _value = 0;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Slider'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          direction: Axis.horizontal,
          children: <Widget>[
            Text(_value.toInt().toString()),
            Slider(
              value: _value,
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              min: 0,
              max: 100,
              label: _value.toInt().toString(), //The floating label
              divisions: 100, //This will display the floating label while sliding the slider.
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vThxTClAmvJavZaJQBFTGjbwE490AFT0th2K575PjziQdHFNR0wCWxqVsNrgdKuHlfeIHH2L5CuGdkB/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
