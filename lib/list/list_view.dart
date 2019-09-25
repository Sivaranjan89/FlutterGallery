import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewListview extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewListview> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Listview'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: ListView( //Create Listview
        children: List.generate(50, (int index) { //You can give the array list length in the place of 50
          return ListTile( //you can create any widget. I have used listtile for this example. This widget will get generated 50 times
            title: Text('Item ' + index.toString()),
            subtitle: Text('Subtitle for Item ' + index.toString()),
            leading: Icon(Icons.account_box, color: Colors.black, size: 40),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 40),
            onTap: () { print('Clicked ' + index.toString()); },
          );
        }),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vR_PnuuBU8WWraYmWS21dc10QHIbjWrRUQmqIjr4WA5LpO7dpTN5Ex4hT7UH0_n5I8owMsrvkil9ao5/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
