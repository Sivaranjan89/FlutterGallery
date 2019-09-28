import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewDraggable extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewDraggable> {

  var completed = [false, false, false];

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
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Drag n Drop'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Wrap( //Draggable Objects
            direction: Axis.vertical,
            spacing: 40,
            children: <Widget>[
              Draggable<String>(
                child: completed[0] ? Container(height: 100, width: 100) : Image.asset('assets/images/lion.png', width: 100),
                childWhenDragging: completed[0] ? Container() : Image.asset('assets/images/lion.png', width: 100, color: Colors.orange),
                data: 'lion',
                feedback: Image.asset('assets/images/lion.png', width: 100),
              ),
              Draggable<String>(
                child: completed[1] ? Container(height: 100, width: 100) : Image.asset('assets/images/elephant.png', width: 100),
                childWhenDragging: completed[1] ? Container() : Image.asset('assets/images/elephant.png', width: 100, color: Colors.grey),
                data: 'elephant',
                feedback: Image.asset('assets/images/elephant.png', width: 100),
              ),
              Draggable<String>(
                child: completed[2] ? Container(height: 100, width: 100) : Image.asset('assets/images/croc.png', width: 100),
                childWhenDragging: completed[2] ? Container() : Image.asset('assets/images/croc.png', width: 100, color: Colors.lightGreenAccent),
                data: 'croc',
                feedback: Image.asset('assets/images/croc.png', width: 100),
              ),
            ],
          ),

          Wrap( //Drag Targets
            direction: Axis.vertical,
            spacing: 40,
            children: <Widget>[
              DragTarget<String>(
                onWillAccept: (value) => value == 'elephant',
                onAccept: (value) {
                  setState(() {
                    completed[1] = true;
                    scaffoldState.currentState.showSnackBar(SnackBar(content: Text('Great !')));
                  });
                },
                builder: (context, candidates, rejects) {
                  return Container(width: 100, height: 100, color: Colors.grey);
                },
              ),
              DragTarget<String>(
                onWillAccept: (value) => value == 'croc',
                onAccept: (value) {
                  setState(() {
                    completed[2] = true;
                    scaffoldState.currentState.showSnackBar(SnackBar(content: Text('Great !')));
                  });
                },
                builder: (context, candidates, rejects) {
                  return Container(width: 100, height: 100, color: Colors.lightGreenAccent);
                },
              ),
              DragTarget<String>(
                onWillAccept: (value) => value == 'lion',
                onAccept: (value) {
                  setState(() {
                    completed[0] = true;
                    scaffoldState.currentState.showSnackBar(SnackBar(content: Text('Great !')));
                  });
                },
                builder: (context, candidates, rejects) {
                  return Container(width: 100, height: 100, color: Colors.orange);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vROWZyIl4Hw-0iZIKxnwDP7W9Fht1Q_E1i0bAVMuPQPjc0tYhVtm-56WRT91DIRET-2up30gl3RLBUV/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
