import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:flutter_gallery/datatable/User.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewDataTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewDataTable> {
  List<User> users;
  List<User> selectedUsers;
  bool sortAscending;
  int sortColumn = 0;

  @override
  void initState() {
    super.initState();
    selectedUsers = List();
    users = User.getUsers();
    sortAscending = false;
    sortColumn = 0;
    onSortColum(sortColumn, sortAscending);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Data Table'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () {
          showCode();
        },
      ),
      body: SizedBox.expand(
          child: DataTable(
        horizontalMargin: 1,
        columnSpacing: 1, //Give margins and spacing to make sure overflow does not happen
        dataRowHeight: 50, //Specify the height of each row
        headingRowHeight: 50, //Specify the height of Header in each column
        sortAscending: !sortAscending, //Setting this value will display sort symbol (google seems to have ocnfused the direction of ascending and descending so have given the opposite
        sortColumnIndex: sortColumn, //Which column to sort
        columns: [ //Create the columns here
          DataColumn(
              label: Text('First Name',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              numeric: false,
              onSort: (index, ascending) {
                setState(() { //Update the column to sort here
                  sortColumn = index;
                  sortAscending = !ascending;
                  onSortColum(index, sortAscending);
                });
              }),
          DataColumn(
              label: Text('Last Name',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              numeric: false,
              onSort: (index, ascending) {
                setState(() {
                  sortColumn = index;
                  sortAscending = !ascending;
                  onSortColum(index, sortAscending);
                });
              }),
          DataColumn(
              label: Text('Age',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              numeric: false,
              onSort: (index, ascending) {
                setState(() {
                  sortColumn = index;
                  sortAscending = !ascending;
                  onSortColum(index, sortAscending);
                });
              }),
        ],
        rows: users
            .map((user) => DataRow( //Generate data rows here
                  onSelectChanged: (b) {
                    setState(() {
                      onRowSelected(b, user);
                    });
                  },
                  selected: selectedUsers.contains(user),
                  cells: [
                    DataCell(Text(user.firstName)),
                    DataCell(Text(user.lastName)),
                    DataCell(Text(user.age.toString())),
                  ],
                ))
            .toList(),
      )),
    );
  }

  onRowSelected(bool selected, User user) {
    if(selected) {
      selectedUsers.add(user);
    } else {
      selectedUsers.remove(user);
    }
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
    else if (columnIndex == 1) {
      if (ascending) {
        users.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        users.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    }
    else if (columnIndex == 2) {
      if (ascending) {
        users.sort((a, b) => a.age.compareTo(b.age));
      } else {
        users.sort((a, b) => b.age.compareTo(a.age));
      }
    }
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog(
        'https://docs.google.com/document/d/e/2PACX-1vSBhRXyQIY3cOTdTYovo7-CRDYIDk-oA-0tLlUUOrIBggi5sUDzdP5i813duQ--7rDshHIgnIYMmorT/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
