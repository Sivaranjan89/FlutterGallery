import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSwipeDismiss extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSwipeDismiss> {

  var items = ['Android', 'iOS', 'Flutter', 'Xamarin', 'HTML', 'React', 'Ruby', 'Photoshop', 'Flash', 'Maya', '3DS Max'];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Swipe to Dismiss'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return Divider(color: Colors.black, height: 1);
          },
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(index),
              child: ListTile(title: Text(items[index]), leading: Icon(Icons.reorder)),
              background: Container(color: Colors.white),
              secondaryBackground: Container(color: Colors.black),
              onDismissed: (direction) {
                if(direction == DismissDirection.endToStart) { //Swipe from right to left
                  //Implement your action here
                }
                else { //Swipe from left to right
                  //Implement your action here
                }
              },
            );
          }),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTRHLH6OWYBn-TcaM1iBQUUEeBZ0q7CLsma6L2RsdgRWeAsn76SPrlsBvecCxMF4EUPVsyEZHIGXQID/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
