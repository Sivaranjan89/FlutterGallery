import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewRangeSlider extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewRangeSlider> {

  RangeValues _values = RangeValues(0.3, 0.7);


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Range Slider'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          direction: Axis.horizontal,
          children: <Widget>[
            Text('Range - Start(' + _values.start.toInt().toString() + ') , End(' + _values.end.toInt().toString() + ')'),
            RangeSlider(
              values: _values,
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              min: 0,
              max: 100,
              labels: RangeLabels(_values.start.toInt().toString(), _values.end.toInt().toString()),
              divisions: 100,
              onChanged: (value) {
                setState(() {
                  _values = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vQQ5nE3tpo9eGWGiuyz1IFXXGFuM86D6VoipbymTUnbCBx-eNoCs0XN9enik--efMihI52o31h4IT9B/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
