import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:flutter_gallery/data/db_helper.dart';
import 'package:flutter_gallery/datatable/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewDatabase extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewDatabase> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> columns = List();
  List<String> rows = List();
  List<User> users = List<User>();

  String first_name, last_name, _age;

  bool loadCompleted = false;

  @override
  void initState() {
    super.initState();

    columns.add('First Name');
    columns.add('Last Name');
    columns.add('Age');

    Future<Null> openDB = DBHelper.instance.openMyDatabase();
    openDB.then((value) {
      updateUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(loadCompleted) {
      return Scaffold(
          backgroundColor: ApplicationConstants.appBlue,
          appBar: PreviewAppBar(appBar: AppBar(), title: 'Database'),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
          ),
          body: SizedBox(
              width: 420,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  DataTable(
                    horizontalMargin: 10,
                    columnSpacing: 10,
                    dataRowHeight: 50,
                    headingRowHeight: 50,
                    columns: columns.map((value) => DataColumn(
                        label: Text(value, style: TextStyle(color: Colors.white, fontSize: 17)),
                        numeric: false
                    )).toList(),

                    rows: users.map((user) => DataRow(
                        cells: [
                          DataCell(Text(user.firstName)),
                          DataCell(Text(user.lastName)),
                          DataCell(Text(user.age.toString())),
                        ]
                    )).toList(),
                  ),

                  Form(
                      key: formKey,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: '',
                                onChanged: (value) {
                                  first_name = value;
                                },
                                decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'First Name cannot be empty';
                                  }
                                  return null;
                                },
                              )
                          ),

                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: '',
                                onChanged: (value) {
                                  last_name = value;
                                },
                                decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Last Name cannot be empty';
                                  }
                                  return null;
                                },
                              )
                          ),

                          Expanded(
                              flex: 1,
                              child: TextFormField(
                                initialValue: '',
                                onChanged: (value) {
                                  _age = value;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: 'Age', border: OutlineInputBorder()),
                                validator: (value) {
                                  if(value.isEmpty) {
                                    return 'Age cannot be empty';
                                  }
                                  return null;
                                },
                              )
                          ),
                        ],
                      )
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Add Row', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        shape: OutlineInputBorder(),
                        onPressed: () {
                          if(formKey.currentState.validate()) {
                            setState(() {
                              User user = User(firstName: first_name, lastName: last_name, age: int.parse(_age));
                              DBHelper.instance.insert(user);
                              updateUsers();
                            });
                          }
                        },
                      )
                    ],
                  )

                ],
              )
          )
      );
    } else {
      return Scaffold(
        backgroundColor: ApplicationConstants.appBlue,
        body: Container(),
      );
    }
  }


  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vRnrCbyKFqGJZcG7mniKjDJ1ZdjIn-pyMxe-zjpzv5mlai92jjB52lXbWmarjMIdWX45QlWRS7QFBl9/pub');
    showDialog(context: context, builder: (context) => dialog);
  }

  List<DataColumn> buildColumns() {
    return List.generate(columns.length, (index) {
      DataColumn(
          label: Text(columns[index], style: TextStyle(color: Colors.white, fontSize: 17)),
          numeric: false);
    });
  }

  List<DataRow> buildRows() {
    return List.generate(users.length, (index) {
      DataRow( //Generate data rows here
        cells: [
          DataCell(Text(users[index].firstName)),
          DataCell(Text(users[index].lastName)),
          DataCell(Text(users[index].age.toString())),
        ],
      );
    });
  }

  void updateUsers() {
    users.clear();
    Future<List<User>> userFuture = DBHelper.instance.getUsers();
    userFuture.then((user) {
      setState(() {
        users = user;
        loadCompleted = true;
      });
    });
  }
}
