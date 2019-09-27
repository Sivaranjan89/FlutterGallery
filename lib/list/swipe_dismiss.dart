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

  var items = ['Android', 'iOS', 'Flutter', 'Xamarin'];

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
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Reorder List'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: ReorderableListView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        header: Text('Long press an Item to Reorder'),
        onReorder: (oldvalue, newvalue) {
          setState(() {
            if (newvalue > oldvalue) {
              newvalue = newvalue - 1;
            }

            String item = items[oldvalue];
            items.removeAt(oldvalue);
            items.insert(newvalue, item);
          });
        },
        children: List.generate(items.length, (index) {
          return ListTile(title: Text(items[index]), leading: Icon(Icons.reorder), key: ValueKey(index));
        }),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTiwOIPz2VR6Y7bv50sIOJ4jUnaWiYWdmhsgbVgeIkTZf2kwb1XHGB6RQwT_0pfRsr49LrrMNLLYSZE/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
