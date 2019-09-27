import 'dart:core';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:flutter_gallery/datatable/User.dart';
import 'package:flutter_gallery/datatable/member.dart';

import '../app_constants.dart';

class PreviewPaginatedDataTable extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewPaginatedDataTable> {
  List<Member> users;
  bool sortAscending = false;
  int sortColumn = 0;
  int rowsPerPage = 4;

  FamilyDataSource dataSource;

  @override
  void initState() {
    super.initState();

    users = Member.getUsers(); //Get the data to be populated
    onSortColum(sortColumn, sortAscending); //By Default we assign descending
    dataSource = FamilyDataSource(members: users); //Initiate the Datasource and pass he list array to it
  }

  @override
  Widget build(BuildContext context) {
    dataSource.updateDataSource(users); //Update the data source whenever setState is called

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
      body: SingleChildScrollView( //Wrapping it in a SingleChildScrollView will allow the table to be wrapped correctly (WRAP_CONTENT)
        child: PaginatedDataTable(
          header: (Text('Family Records')), //Title for the Table (optional)
          rowsPerPage: rowsPerPage, //By Default how many rows per page should be there
          availableRowsPerPage: [4, 8, users.length], //Give options to user to choose how many rows they can see per page
          onRowsPerPageChanged: (value) { //Whenever user changes the row per page value, assign that value to our variable
            setState(() {
              rowsPerPage = value;
            });
          },
          columns: [ //Create the columns here
            DataColumn(
                label: Text('First Name',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() { //Update the column to sort here
                    sortColumn = index;
                    sortAscending = !sortAscending;
                    onSortColum(index, sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Last Name',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    sortColumn = index;
                    sortAscending = !sortAscending;
                    onSortColum(index, sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Age',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    sortColumn = index;
                    sortAscending = !sortAscending;
                    onSortColum(index, sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Gender',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    sortColumn = index;
                    sortAscending = !sortAscending;
                    onSortColum(index, sortAscending);
                  });
                }),
            DataColumn(
                label: Text('Status',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                numeric: false,
                onSort: (index, ascending) {
                  setState(() {
                    sortColumn = index;
                    sortAscending = !sortAscending;
                    onSortColum(index, sortAscending);
                  });
                }),
          ],

          source: dataSource, //Assign the data source here

        ),
      ),
    );
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
    else if (columnIndex == 3) {
      if (ascending) {
        users.sort((a, b) => a.gender.compareTo(b.gender));
      } else {
        users.sort((a, b) => b.gender.compareTo(a.gender));
      }
    }
    else if (columnIndex == 4) {
      if (ascending) {
        users.sort((a, b) => a.status.compareTo(b.status));
      } else {
        users.sort((a, b) => b.status.compareTo(a.status));
      }
    }
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog(
        'https://docs.google.com/document/d/e/2PACX-1vQTkKG4BvbOwlZvFd2al68fllMBGUzw6Dd0AAJ_QB8CkLx8Qy-aXiXy6yS1H_rZbcvmLYIU4VKb4gzr/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}

class FamilyDataSource extends DataTableSource {

  int selectedCount = 0;

  List<Member> members;

  FamilyDataSource({this.members});


  @override
  DataRow getRow(int index) { //Design the Data row here
    return DataRow.byIndex(
      index: index,
      selected: members[index].selected,
      onSelectChanged: (b) {
        selectedCount += b ? 1 : -1;
        members[index].selected = b;
        notifyListeners(); //notifyListener will refresh the data source
      },
      cells: <DataCell>[
        DataCell(Text(members[index].firstName)),
        DataCell(Text(members[index].lastName)),
        DataCell(Text(members[index].age.toString())),
        DataCell(Text(members[index].gender)),
        DataCell(Text(members[index].status)),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => members.length;

  @override
  int get selectedRowCount => selectedCount;

  updateDataSource(List<Member> updatedList) { //Use this method for actions to update the data
    members = updatedList;
    notifyListeners();
  }

  List<Member> getSelected() { //Use this method for actions to get the list of selected entries
    List<Member> selected = List();

    for(int i=0; i<members.length; i++) {
      if(members[i].selected) {
        selected.add(members[i]);
      }
    }

    return selected;
  }

}
