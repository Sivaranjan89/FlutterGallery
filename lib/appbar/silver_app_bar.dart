import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSilverAppbar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSilverAppbar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30), onPressed: () {
              Navigator.pop(context);
            }),
            title: Text('SliverAppBar', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'londrina')),
            centerTitle: true,
            automaticallyImplyLeading: false, //If there is no Leading Widget then that space becomes available
            expandedHeight: 200, //The height of the collapsing appbar
            flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.parallax ,background: Image.asset('assets/images/wall.jpg', fit: BoxFit.cover)),
            //floating: true, //If you want the appbar to also move away
            pinned: true,
          ),

          SliverList( //The contents of the page can be drawn here. Here we are drawing a list. To use other Widgets use SliverFillRemaining
            delegate: SliverChildBuilderDelegate((context, index) =>
                ListTile(
                  title: Text('Item ' + index.toString()),
                  subtitle: Text('Subtitle for Item ' + index.toString()),
                  leading: Icon(Icons.account_box, color: Colors.black, size: 40),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 40),
                  onTap: () { print('Clicked ' + index.toString()); },
                ),
            childCount: 50),
          )
        ],
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRJLHteQQ5HTv4lmYGxVHUipRxe5Zx869d953TzvPHexRa9V-wXlpXiQBDqotBr1HhoBZuGuD5ubOfl/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
