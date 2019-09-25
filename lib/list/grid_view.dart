import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewGridView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewGridView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'GridView'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 4,
        children: List.generate(40, (int index) { //You can give the array list length in the place of 40
          return GridTile( //you can create any widget. I have used listtile for this example. This widget will get generated 50 times
            child: Card(
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.account_box, color: Colors.black, size: 60),
                  Text('Item ' + index.toString())
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTn_wjDUuHlGV6vH0YrD0JzsJTYG8-TCuQgOG7O6o3A68gQdFWO9sQzQsDV8wkZ6T1SLpyikFiMrmoP/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
