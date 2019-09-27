import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:flutter_gallery/list/Employee.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewExpansionTile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewExpansionTile> {

  List<Employee> data = List();

  @override
  void initState() {
    super.initState();
    data = Employee.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'ExpansionTile'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            title: Text('User Name'),
            leading: Icon(Icons.account_box, color: Colors.black, size: 40),
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    direction: Axis.vertical,
                    spacing: 10,
                    children: <Widget>[
                      SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
                      SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
                    ],
                  )
              )
            ],
          ),

          ExpansionTile(
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            title: Text('Father Name'),
            leading: Icon(Icons.account_box, color: Colors.black, size: 40),
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    direction: Axis.vertical,
                    spacing: 10,
                    children: <Widget>[
                      SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
                      SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
                    ],
                  )
              )
            ],
          ),

          ExpansionTile(
            backgroundColor: Colors.white,
            initiallyExpanded: false,
            title: Text('Mother Name'),
            leading: Icon(Icons.account_box, color: Colors.black, size: 40),
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    direction: Axis.vertical,
                    spacing: 10,
                    children: <Widget>[
                      SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
                      SizedBox(width: 250, child: TextField(decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))))),
                    ],
                  )
              )
            ],
          )
        ],
      )
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRa1F8yfYQLZekXqIbu3yJIhvBJzsCo0sYBJUNq1-ZuckeyAe96RLp20CIBYhRKRjkrlrTyXsPT2Yek/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}



