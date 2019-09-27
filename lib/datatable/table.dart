import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewTable extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewTable> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Table'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle, //Allign the Items in each cell in middle
          border: TableBorder.all(width: 2), //Will design a border for all cells
          children: [ //Create multiple table rows here
            TableRow(
                children: [
                  Center(child: Text('1:1', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  Center(child: Text('1:2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  Center(child: Text('1:3', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                ]
            ),

            TableRow(
                children: [
                  Center(child: Text('2:1', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  Center(child: Text('2:2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  Center(child: Text('2:3', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                ]
            ),

            TableRow(
                children: [
                  Center(child: Text('3:1', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  Center(child: Text('3:2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                  Center(child: Text('3:3', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                ]
            ),
          ],
        )
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vR8tIg5ScBmnhEJcuq57pxt8gWZG6HHpvyCcOYISfHbggpUdGLpLORXXOAWJjEwv1zn-ySNgjtxficz/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
