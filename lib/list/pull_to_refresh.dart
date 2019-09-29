import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';

import '../app_constants.dart';

class PreviewPTR extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewPTR> {

  bool isRefreshing = false;

  var items = [];

  int itemCount = 0;

  @override
  void initState() {
    super.initState();
    addItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Pull to Refresh'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: RefreshIndicator(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(items[index]), leading: Icon(Icons.refresh),);
            }
        ),
        onRefresh: () => _onRefresh(),
        backgroundColor: Colors.white,
        color: Colors.black,
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        addItems();
      });
    });
    return null;
  }

  void addItems() {
    for(int i=0; i<5; i++) {
      items.add('Item ' + itemCount.toString());
      itemCount += 1;
    }
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vT4KAB8UaHmqo9y7iKP4Kyb7I9yvMKu5A3cQIDzSZjvyxVN0qPCjp3ZaqQVZ_dNA8cw2-jKhaYNZtLn/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
