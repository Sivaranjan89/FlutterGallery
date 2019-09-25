import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewBottomBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewBottomBar> {

  var _selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Bottom Bar'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),

      body: Center(
        child: Text(''),
      ),

      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting, //Use this type if you wish to dsplay shifting bottom navigation bar
        iconSize: 20, //Icon size in bottom navigation bar
        onTap: (index) {
          setState(() {
            _selected = index; //Updating the index of the selected item
          });
        },
        currentIndex: _selected,
        backgroundColor: Colors.black, //Background color of the complete bottom bar
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.white),
              activeIcon: Icon(Icons.account_box, color: Colors.red, size: 40), //Giving increased size here to highlight selected icon
              title: Text('Profile', style: TextStyle(color: _selected == 0?Colors.red:Colors.white)) //Adjust color based on selection here
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on, color: Colors.white),
              activeIcon: Icon(Icons.location_on, color: Colors.red, size: 40),
              title: Text('Stores', style: TextStyle(color: _selected == 1?Colors.red:Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.image, color: Colors.white),
              activeIcon: Icon(Icons.image, color: Colors.red, size: 40),
              title: Text('Gallery', style: TextStyle(color: _selected == 2?Colors.red:Colors.white))
          ),
        ],
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vTIxSNFKL5dwVM-l3K_KPHxS_HXweELMPXlH8VIwMeAZsstovUnokDRsOytyYlA253A9qxHJqluqQCT/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}