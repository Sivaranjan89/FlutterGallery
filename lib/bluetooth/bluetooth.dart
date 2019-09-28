import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewBluetooth extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewBluetooth> {

  FlutterBluetoothSerial bluetoothSerial = FlutterBluetoothSerial.instance;

  List<BluetoothDevice> devicesList = [];
  BluetoothDevice device;
  bool connected = false;
  bool pressed = false;


  @override
  void initState() {
    super.initState();
    bluetoothState();
  }

  Future<Void> bluetoothState() async {
    List<BluetoothDevice> devices = [];

    devices = await bluetoothSerial.getBondedDevices();

    bluetoothSerial.onStateChanged().listen((state){
      switch(state) {
        case FlutterBluetoothSerial.CONNECTED:
          setState(() {
            connected = true;
            pressed = false;
          });
          break;

        case FlutterBluetoothSerial.DISCONNECTED:
          setState(() {
            connected = false;
            pressed = false;
          });
          break;
      }
    });

    setState(() {
      devicesList = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Bluetooth'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(15),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: <Widget>[
            Text('Add the dependency flutter_bluetooth_serial: ^0.0.4', style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(icon: Icon(Icons.bluetooth), iconSize: 40, color: connected ? Colors.black : Colors.grey, onPressed: () {
              if(!pressed) {
                connectBluetooth();
                pressed = true;
              }
            }),
            Text(pressed ? 'Connecting' : '', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  connectBluetooth() {
    bluetoothSerial.isConnected.then((connected) {
      /*bluetoothSerial.connect(device).timeout(Duration(seconds: 5)).catchError((error) {
        setState(() {
          connected = false;
          pressed = false;
        });
      });*/

      if(connected) {
        bluetoothSerial.write("1");
      }

    });
  }

  disableBluetooth() {
    bluetoothSerial.isConnected.then((connected) {
      /*bluetoothSerial.connect(device).timeout(Duration(seconds: 5)).catchError((error) {
        setState(() {
          connected = false;
          pressed = false;
        });
      });*/

      if(connected) {
        bluetoothSerial.write("0");
      }

    });
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSiFRAsO0CeVLq6RbHp5SCmzqgOmZ6QgWqL5uWhSZG7RBBlT5nXWqbkkgpdOXpcVrBCQD5NSYPHXAOh/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
