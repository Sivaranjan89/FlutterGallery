
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

  static List<User> getUser() {
    List<User> users = List();
    users.add(User(firstName: 'Sivaranjan', lastName: 'Langesan', age: 30));

    return users;
  }

  factory User.fromMap(Map<String, dynamic> data) => User(firstName: data['firstName'], lastName: data['lastName'], age: data['age']);

  Map<String, dynamic> toMap() => {"firstName": firstName, "lastName": lastName, "age": age};

  static List<User> fromList(List<Map<String,dynamic>> query) {
    List<User> notes = List<User>();
    for (Map map in query) {
      notes.add(User.fromMap(map));
    }
    return notes;
  }

}