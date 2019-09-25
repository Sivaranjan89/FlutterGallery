import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewSilverAppbarFAB extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewSilverAppbarFAB> {

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() =>
        setState(() {

        }));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30), onPressed: () {
                  Navigator.pop(context);
                }),
                title: Text('Sliver FAB', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'londrina')),
                centerTitle: true,
                automaticallyImplyLeading: false, //If there is no Leading Widget then that space becomes available
                expandedHeight: 200, //The height of the collapsing appbar
                flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.none ,background: Image.asset('assets/images/wall.jpg', fit: BoxFit.cover)),
                //floating: true, //If you want the appbar to also move away
                pinned: true,
              ),

              SliverList( //The contents of the page can be drawn here. Here we are drawing a list
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
          buildFAB()
        ],
      ),
    );
  }

  Widget buildFAB() {
    double top = 200; //The Top margin for Floating Action Button

    double scaleStart = 200.0; //Specify when the shrinking should start

    double scaleEnd = scaleStart / 2;

    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < top - scaleStart) {
        scale = 1.0;
      } else if (offset < top - scaleEnd) {
        scale = (top - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return new Positioned(
      top: top,
      right: 60.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)),
          onPressed: () {showCode();},
        ),
      ));
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTc0cFxfO-qaB8IzQtKrSHmklGuYCTQ6rnoOpWKXVEcP3SpJXJ2Nmv8Nna2euom2NIBxFWXBGsGpySS/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
