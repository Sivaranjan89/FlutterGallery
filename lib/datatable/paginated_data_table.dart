import 'dart:core';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:flutter_gallery/datatable/User.dart';
import 'package:flutter_gallery/datatable/member.dart';

import '../app_constants.dart';

class PreviewPaginatedDataTable extends StatefulWidget {
  List<Member> users;
  List<Member> selectedUsers;
  bool sortAscending;
  int sortColumn = 0;
  int rowsPerPage = 5;

  @override
  State<StatefulWidget> createState() {
    selectedUsers = List();
    users = Member.getUsers();
    sortAscending = false;
    sortColumn = 0;
    rowsPerPage = 5;
    return _State();
  }
}

class _State extends State<PreviewPaginatedDataTable> {

  @override
  void initState() {
    super.initState();

    onSortColum(widget.sortColumn, widget.sortAscending);
  }

  @override
  Widget build(BuildContext context) {
    print('COLUMN :: ' + widget.sortColumn.toString() + '  :::::  ASCEND ? ' + widget.sortAscending.toString());
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'Paginated Data Table'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)),
        onPressed: () {
          showCode();
        },
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: (Text('Family Records')),
          rowsPerPage: widget.rowsPerPage,
          availableRowsPerPage: [5,10,15],
          onRowsPerPageChanged: (value) {
            setState(() {
              widget.rowsPerPage = value;
            });
          },
          columns: [ //Create the columns here
            DataColumn(
                label: Text('First Name',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() { //Update the column to sort here
                    widget.sortColumn = index;
                    widget.sortAscending = !widget.sortAscending;
                    onSortColum(index, widget.sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Last Name',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    widget.sortColumn = index;
                    widget.sortAscending = !widget.sortAscending;
                    onSortColum(index, widget.sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Age',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    widget.sortColumn = index;
                    widget.sortAscending = !widget.sortAscending;
                    onSortColum(index, widget.sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Gender',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    widget.sortColumn = index;
                    widget.sortAscending = !widget.sortAscending;
                    onSortColum(index, widget.sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Status',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    widget.sortColumn = index;
                    widget.sortAscending = !widget.sortAscending;
                    onSortColum(index, widget.sortAscending);
                  });
                }),
          ],

          source: FamilyDataSource(users: widget.users),

        ),
      ),
    );
  }

  onRowSelected(bool selected, Member user) {
    if(selected) {
      widget.selectedUsers.add(user);
    } else {
      widget.selectedUsers.remove(user);
    }
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        widget.users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        widget.users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
    else if (columnIndex == 1) {
      if (ascending) {
        widget.users.sort((a, b) => a.lastName.compareTo(b.lastName));
      } else {
        widget.users.sort((a, b) => b.lastName.compareTo(a.lastName));
      }
    }
    else if (columnIndex == 2) {
      if (ascending) {
        widget.users.sort((a, b) => a.age.compareTo(b.age));
      } else {
        widget.users.sort((a, b) => b.age.compareTo(a.age));
      }
    }
    else if (columnIndex == 3) {
      if (ascending) {
        widget.users.sort((a, b) => a.gender.compareTo(b.gender));
      } else {
        widget.users.sort((a, b) => b.gender.compareTo(a.gender));
      }
    }
    else if (columnIndex == 4) {
      if (ascending) {
        widget.users.sort((a, b) => a.status.compareTo(b.status));
      } else {
        widget.users.sort((a, b) => b.status.compareTo(a.status));
      }
    }
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog(
        'https://docs.google.com/document/d/e/2PACX-1vSBhRXyQIY3cOTdTYovo7-CRDYIDk-oA-0tLlUUOrIBggi5sUDzdP5i813duQ--7rDshHIgnIYMmorT/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}

class FamilyDataSource extends DataTableSource {

  int selectedCount = 0;

  List<Member> users;

  FamilyDataSource({this.users});


  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      selected: users[index].selected,
      onSelectChanged: (b) {
        selectedCount += b ? 1 : -1;
        users[index].selected = b;
        notifyListeners();
      },
      cells: <DataCell>[
        DataCell(Text(users[index].firstName)),
        DataCell(Text(users[index].lastName)),
        DataCell(Text(users[index].age.toString())),
        DataCell(Text(users[index].gender)),
        DataCell(Text(users[index].status)),
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => users.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => selectedCount;



}
