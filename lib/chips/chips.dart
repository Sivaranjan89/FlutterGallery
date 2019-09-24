import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewChips extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewChips> {

  var chips = ['Android', 'iOS', 'Flutter'];
  var chips2 = ['Android', 'iOS', 'Flutter'];
  var chips3 = ['Android', 'iOS', 'Flutter'];
  var chips3values = [false, false, false];
  var chips3values2 = [false, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Chips'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          direction: Axis.vertical,
          children: <Widget>[
            SizedBox(width: 350, child: Text('Normal Chips - Used for display or can be deleted by clicking delete icon', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            SizedBox(width: 400, child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: generateNormalChips(),
            )),

            SizedBox(width: 350, child: Text('Action Chips - These chips can work like buttons with an action on click', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            SizedBox(width: 400, child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: generateActionChips(),
            )),

            SizedBox(width: 350, child: Text('Choice Chips - These chips offer choices for user to select from', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            SizedBox(width: 400, child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: generateChoiceChips(),
            )),

            SizedBox(width: 350, child: Text('Filter Chips - These chips offer two states for filtering', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            SizedBox(width: 400, child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: generateFilterChips(),
            )),
          ],
        ),
      ),
    );
  }

  WebViewController _myController;
  void showCode() {
    WebView webView = WebView(
      initialUrl: 'https://docs.google.com/document/d/e/2PACX-1vRBYq1FsqSO41xQgPlwAQTpogLuyE4YY1re_tYPK5NImA2eYifWSBvc3ZiIxTShbnCqoHKeJYkEkJ9J/pub',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller){ _myController = controller; },
      onPageFinished: (url) {
        _myController.evaluateJavascript("javascript:(function() { " +
            "document.getElementById('footer').style.display='none';})()");
      },
    );
    Dialog dialog = ApplicationConstants.getCodeDialog(webView);
    showDialog(context: context, builder: (context) => dialog);
  }

  List<Widget> generateNormalChips() {
    List<Widget> widgets = List();

    for(int i=0; i<chips.length; i++) {
      widgets.add(Chip(key: ValueKey<String>(chips[i]), label: Text(chips[i]), backgroundColor: Colors.white, avatar: Icon(Icons.mobile_screen_share), deleteIcon: Icon(Icons.cancel), onDeleted: () {
        setState(() {
          chips.remove(chips[i]);
        });
      }));
    }

    return widgets;
  }

  List<Widget> generateActionChips() {
    List<Widget> widgets = List();

    for(int i=0; i<chips2.length; i++) {
      widgets.add(ActionChip(label: Text(chips2[i]), backgroundColor: Colors.white, avatar: Icon(Icons.mobile_screen_share), onPressed: () {
        //Execute ur action here
      },));
    }

    return widgets;
  }

  List<Widget> generateChoiceChips() {
    List<Widget> widgets = List();

    for(int i=0; i<chips3.length; i++) {
      widgets.add(ChoiceChip(label: Text(chips3[i]), backgroundColor: Colors.white, avatar: Icon(Icons.mobile_screen_share), selectedColor: Colors.lightGreenAccent, selected: chips3values[i], onSelected: (bool value) {
        setState(() {
          chips3values[i] = !chips3values[i];
        });
      },));
    }

    return widgets;
  }

  List<Widget> generateFilterChips() {
    List<Widget> widgets = List();

    for(int i=0; i<chips3.length; i++) {
      widgets.add(FilterChip(label: Text(chips3[i]), backgroundColor: Colors.white, selectedColor: Colors.red, selected: chips3values2[i], onSelected: (bool value) {
        setState(() {
          chips3values2[i] = !chips3values2[i];
        });
      },));
    }

    return widgets;
  }
}
