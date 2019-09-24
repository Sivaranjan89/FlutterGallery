import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewTextForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewTextForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'TextFormField'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () {
          showCode();
        },
      ),
      body: Center(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Wrap(
                //This layout works like a linear layout and allows us to space the components evenly
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing:
                    10, //This will give 10 spacing between each element in this layout
                direction: Axis
                    .vertical, //This will render the elements in the direction pecified
                children: <Widget>[
              //Use Sized box to wrap textfield else input decoration will not render
              SizedBox(
                  width: 250,
                  child: TextFormField(
                      decoration: InputDecoration(hintText: 'Username'),
                      validator: (value) { //Declare your validation for this TextField here
                        if (value.isEmpty) { //If this validation is not met, It will show the return string as error message
                          return "Please Enter the Username";
                        }
                        return null;
                      })),

              SizedBox(
                  width: 250,
                  child: TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please Enter the Password";
                        }
                        return null;
                      })),

              SizedBox(
                  width: 250,
                  child: FlatButton(
                      color: ApplicationConstants.appBlue,
                      shape: OutlineInputBorder(),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          //If validation is met then it will execute this block
                        }
                      },
                      child: Text('Submit'))),
            ])
        ),
      )),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRMUDbA0KdQn0quZnLDV3smuE_5uVJ7enEWsyagq4X-fi8567-573PE8ZYdCQzI9mvqDLB41qqWMvQV/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
