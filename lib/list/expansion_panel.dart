import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';
import 'Employee.dart';

class PreviewExpansionPanelList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewExpansionPanelList> {
  List<Employee> data = List();

  @override
  void initState() {
    super.initState();
    data = Employee.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'ExpansionPanelList'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () {
          showCode();
        },
      ),
      body: SingleChildScrollView(
          child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 500),
              expansionCallback: (index, expanded) {
                setState(() {
                  data[index].expanded = !expanded;
                });
              },
              children: data
                  .map((employee) => ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) { //Design the Header for each panel here
                        return ListTile(
                          title: Text(employee.firstName),
                          leading: Icon(Icons.account_box,
                              color: Colors.black, size: 40),
                        );
                      },

                      isExpanded: employee.expanded,

                      body: Wrap( //Design the expanded body for each item here
                        direction: Axis.vertical,
                        spacing: 10,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.arrow_right, color: Colors.black, size: 40),
                              Text('Last Name : ' + employee.lastName),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.arrow_right, color: Colors.black, size: 40),
                              Text('Gender: ' + employee.gender),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.arrow_right, color: Colors.black, size: 40),
                              Text('Age: ' + employee.age.toString()),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.arrow_right, color: Colors.black, size: 40),
                              Text('Status: ' + employee.status),
                            ],
                          ),
                        ],
                      )
              ))
                  .toList())),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog(
        'https://docs.google.com/document/d/e/2PACX-1vTt2ELPXqPsOgE138fCo0tSQiqTJnpEGdasOOwUsx3ShFi8oOe0EZDNZPVex1E7iJe0pQ-etF3Brch9/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
