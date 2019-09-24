import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewDropDownButton extends StatefulWidget {

  int value = 0;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewDropDownButton> {

  List<String> items = ['Android', 'iOS', 'React', 'Xamarin'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Drop Down Button'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          direction: Axis.vertical,
          children: <Widget>[
            DropdownButton(
                hint: SizedBox(width: 100), //Used for displaying hint but in my case I use it to create space between the item and icon
                value: widget.value, //Set the current selected value
                icon: Image.asset('assets/images/logo.png', color: Colors.black, width: 40), //Set the Icon
                style: TextStyle(color: Colors.black, fontSize: 20), //Style the Text for all Items
                underline: Container(height: 1, color: Colors.black), //Style the Underline widget
                onChanged: (int newValue) {
                  setState(() {
                    widget.value = newValue; //This will call build() again with the new selected value
                  });
                },
                items: List.generate(items.length, (int index) { //Generate the Items to be displayed for selection
                  return DropdownMenuItem(
                    child: Text(items.elementAt(index)),
                    value: index,
                  );
                }),
            ),

          ],
        ),
      ),
    );
  }

  void showCode() {
        Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vQxCB5uPJxLRQQKtxjkiiiL-ENP5KcJY3DWszBkNlOVPI5Z4eW4xEh9sPX7YdB5WAeX_M6oGRuctxBI/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
