import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewTimeDateDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewTimeDateDialog> {

  String time, date;

  @override
  void initState() {
    super.initState();
    time = 'Time Picker';
    date = 'Date Picker';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Date / Time Picker'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: <Widget>[
            RaisedButton(child: (Text(time)), onPressed: () {
              showTimeDialog(context);
            }),

            RaisedButton(child: (Text(date)), onPressed: () {
              showDateDialog(context);
            })
          ],
        ),
      ),
    );
  }

  Future<Null> showTimeDialog(BuildContext context) async {
    final TimeOfDay child = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if(child != null && child != TimeOfDay.now()) {
      setState(() {
        time = '24 Hour -> ' + child.hour.toString() + ':' + child.minute.toString(); //Use child.hourOfPeriod for 12 hour format
      });
    }
  }

  Future<Null> showDateDialog(BuildContext context) async {
    final DateTime child = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2018), lastDate: DateTime(2021));

    if(child != null && child != DateTime.now()) {
      setState(() {
        date = child.day.toString() + ':' + child.month.toString() + ':' + child.year.toString(); // Get the new date selected by user
      });
    }
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSMoI3sZK7QcoZDgRsfT2sNKdYFqU9N_fv8ee6CURl_tfux-50_GfewryYJ0t2rN8jblJS-eldpqnNO/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
