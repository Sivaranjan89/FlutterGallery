import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewDrawer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewDrawer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Drawer'),
      drawer: new Drawer( //drawer will open drawer from left. endDrawer will open drawer from right
          child: new ListView(
            children: <Widget>[
              //Add the Drawer Header
              new DrawerHeader(
                child: new Text("DRAWER HEADER"),
                decoration: new BoxDecoration(
                    color: ApplicationConstants.appBlue
                ),
              ),

              //Add the Drawer Options from here
              new ListTile(title: Text('My Account'), leading: Icon(Icons.account_box, size: 40, color: Colors.black), onTap: () {Navigator.pop(context);}),
              new ListTile(title: Text('Find Stores'), leading: Icon(Icons.pin_drop, size: 40, color: Colors.black), onTap: () {Navigator.pop(context);}),
              new ListTile(title: Text('Contact Us'), leading: Icon(Icons.add_call, size: 40, color: Colors.black), onTap: () {Navigator.pop(context);}),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Text('Slide from left end of the screen to the right'),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTLllsEX2wCblKGX7i5CuEh2sE8fAN4jdDP0YEazaI6VbMv9UzzJaC86OIGulWeb1ZM8s1-99G62tMn/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}