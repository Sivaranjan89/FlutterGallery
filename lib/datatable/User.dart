
class User {
  var firstName, lastName;
  int age;


  User({this.firstName, this.lastName, this.age});

  static List<User> getUsers() {
    List<User> users = List();
    users.add(User(firstName: 'Sivaranjan', lastName: 'Langesan', age: 30));
    users.add(User(firstName: 'Mirunalini', lastName: 'Manogarane', age: 29));
    users.add(User(firstName: 'Dheesha', lastName: 'Sivaranjan', age: 1));
    users.add(User(firstName: 'Harini', lastName: 'Manogarane', age: 19));
    users.add(User(firstName: 'Giridhar', lastName: 'Sampathkumar', age: 31));
    users.add(User(firstName: 'Joshua', lastName: 'Daniel', age: 30));
    users.add(User(firstName: 'Srikanth', lastName: 'Dhanagopal', age: 30));
    users.add(User(firstName: 'Manogarane', lastName: 'Soundar', age: 56));
    users.add(User(firstName: 'Langesan', lastName: 'Saba', age: 65));
    users.add(User(firstName: 'Mynavathy', lastName: 'Langesan', age: 60));
    users.add(User(firstName: 'Amudha', lastName: 'Manogarane', age: 50));

    return users;
  }

}