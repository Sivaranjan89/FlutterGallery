import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewPopMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewPopMenu> {

  var isChecked = [false, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(title: 'PopMenu', appBar: AppBar(),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Wrap(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('PopMenuButton   ->   '),
              PopupMenuButton<int>( //This is the menu button
                color: Colors.white,
                itemBuilder: (context) => [ //Design the option Items here
                  PopupMenuItem(value: 0, child: Text('Option 1')),
                  PopupMenuItem(value: 1, child: Text('Option 2')),
                  PopupMenuItem(value: 2, child: Text('Option 3'))
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Checked Menu   ->   '),
              PopupMenuButton<int>(
                onSelected: (value) {
                  setState(() {
                    isChecked[value] = !isChecked[value];
                  });
                },
                color: Colors.white,
                itemBuilder: (context) => [
                  CheckedPopupMenuItem(value: 0, checked: isChecked[0], child: Text('Item 1')),
                  CheckedPopupMenuItem(value: 1, checked: isChecked[1], child: Text('Item 2')),
                  CheckedPopupMenuItem(value: 2, checked: isChecked[2], child: Text('Item 3'))
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('PopMenu Divider   ->   '),
              PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [ //Design the option Items here
                  PopupMenuItem(value: 0, child: Text('Option 1')),
                  PopupMenuDivider(height: 5),
                  PopupMenuItem(value: 1, child: Text('Option 2')),
                  PopupMenuDivider(height: 5),
                  PopupMenuItem(value: 2, child: Text('Option 3')),
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Custom Menu Icon   ->   '),
              PopupMenuButton<int>(
                shape: OutlineInputBorder(),
                offset: Offset(80,100), //Control the location of the items relative to the child
                child: Icon(Icons.settings, color: Colors.black, size: 40),
                color: Colors.white,
                itemBuilder: (context) => [
                  PopupMenuItem(value: 0, child: Text('Option 1')),
                  PopupMenuItem(value: 1, child: Text('Option 2')),
                  PopupMenuItem(value: 2, child: Text('Option 3'))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTxnd8Z46uSOS2xfCQWbImDB5AnOOPxQIC8Bv9fimiWqAYUZCtL3z2VZUh-LnEc9QxvH1tkIxt-0qi1/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
