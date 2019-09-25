import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewListViewBuilder extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewListViewBuilder> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Listview Builder'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: ListView.separated(itemBuilder: (context, index) { //Listview.seperated is same as listview.builder but has support for dividers
        return ListTile( //you can create any widget. I have used listtile for this example. This widget will get generated 50 times
          title: Text('Item ' + index.toString()),
          subtitle: Text('Subtitle for Item ' + index.toString()),
          leading: Icon(Icons.account_box, color: Colors.black, size: 40),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 40),
          onTap: () { print('Clicked ' + index.toString()); },
        );
      }, separatorBuilder: (context, index) { //Here we design the divider using divider widget
        return Divider(color: Colors.black, thickness: 1);
      }, itemCount: 50),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSTl9EyJZvKouR8C9m0ZD7UnaRnL8VdvNNHiv0zq3bINGeyPqRtJP0C0J9uEtLiIOHc6x9jpn-9EYa-/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
