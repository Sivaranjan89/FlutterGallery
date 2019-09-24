import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewImageURL extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewImageURL> {

  @override
  void initState() {
    super.initState();
    //Image.network('https://www.clipartwiki.com/clipimg/full/287-2872751_logo-batman-vs-superman.png', //Load Image from URL
    //        width: 350)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Image (URL)'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          width: 250, //Set Width and Height (Setting only Width will maintain proportion and change height accordingly)
          placeholder: 'assets/images/loading.png', //Image to show while the URL image is being fetched
          image: 'https://www.clipartwiki.com/clipimg/full/287-2872751_logo-batman-vs-superman.png', //URL for image fetch
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vQDlVBr4FUgFPGdRV6aR_AXnhS68INVNgwT1z5sKg_qCwzB8tslC7sOc_t91CaSAqO7x1ZEvhkW7VY3/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
