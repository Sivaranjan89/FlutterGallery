import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Color backgroundColor = Colors.black;
  final String title;
  final AppBar appBar;

  PreviewAppBar({this.title, this.appBar});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class _State extends State<PreviewAppBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30), onPressed: () {
        Navigator.pop(context);
      }),
      title: Text(widget.title, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'londrina')),
      centerTitle: true,
    );
  }
}
