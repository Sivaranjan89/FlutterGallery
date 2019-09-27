
class Employee {
  var firstName, lastName, gender, status;
  int age;

  bool expanded;


  Employee({this.firstName, this.lastName, this.age, this.gender, this.status, this.expanded});

  static List<Employee> getUsers() {
    List<Employee> users = List();
    users.add(Employee(firstName: 'Sivaranjan', lastName: 'Langesan', age: 30, gender: 'Male', status: 'Married', expanded: false));
    users.add(Employee(firstName: 'Giridhar', lastName: 'Sampathkumar', age: 31, gender: 'Male', status: 'Single', expanded: false));
    users.add(Employee(firstName: 'Joshua', lastName: 'Daniel', age: 30, gender: 'Male', status: 'Married', expanded: false));
    users.add(Employee(firstName: 'Srikanth', lastName: 'Dhanagopal', age: 30, gender: 'Male', status: 'Single', expanded: false));

    return users;
  }

}