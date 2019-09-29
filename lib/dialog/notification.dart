import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:flutter_gallery/home/home_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewNotification extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewNotification> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOS = IOSInitializationSettings();
    var settings = InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(settings, onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Notification'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Create Notification'),
          onPressed: () {
            fireNotification();
          },
        ),
      ),
    );
  }

  fireNotification() async {
    var android = AndroidNotificationDetails('channel id', 'channel NAME', 'CHANNEL DESCRIPTION');
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(0, 'Notification', 'This notification was sent from Flutter Gallery App', platform,
        payload: 'HOME');
  }

  Future onSelectNotification(String payload) {
    if(payload == 'HOME') {
      //Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => HomeScreen()));
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    }
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRMCpkG3M4IeRcrit0TpPKEEX5PbJ_XlenBdEeH0idjTp5HRFM_knVXXjfsntFPO9Bdr4-gBFHdsKWK/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
