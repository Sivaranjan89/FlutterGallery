import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSP extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSP> {

  String data;

  SharedPreferences sharedPreferences;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      controller.text = sharedPreferences.getString('SP');

      if (controller.text == null) {
        controller.text = ""; // set an initial value
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Data Persistence'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: <Widget>[
            SizedBox(width: 200, child: TextField(onChanged: (value) {
              //Save to Shared Preference
              data = value;
            }, controller: controller)),

            SizedBox(width: 200, child: Text('Type in a value and click the save button. When you return to this screen, You will see the saved value')),
            SizedBox(width: 200, child: IconButton(icon: Icon(Icons.save, size: 40), onPressed: () {
              saveData(data);
            },))
          ],
        ),
      ),
    );
  }


  saveData(String data) {
    sharedPreferences.setString('SP', data);
  }

  loadData(String key) {
    data = sharedPreferences.getString(key);
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vS3Ag5LzJo74L3r_c7fITfmVug7tbOJy0a_-nR0fnXXH0osS4GuQpfEhaCvVdAewK9V3uuNU4U6_iF1/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
