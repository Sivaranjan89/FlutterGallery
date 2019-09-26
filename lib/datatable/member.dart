
class Member {
  var firstName, lastName, gender, status;
  int age;

  bool selected;


  Member({this.firstName, this.lastName, this.age, this.gender, this.status, this.selected});

  static List<Member> getUsers() {
    List<Member> users = List();
    users.add(Member(firstName: 'Sivaranjan', lastName: 'Langesan', age: 30, gender: 'Male', status: 'I.T', selected: false));
    users.add(Member(firstName: 'Mirunalini', lastName: 'Manogarane', age: 29, gender: 'Female', status: 'Home Maker', selected: false));
    users.add(Member(firstName: 'Dheesha', lastName: 'Sivaranjan', age: 1, gender: 'Female', status: 'Unemployed', selected: false));
    users.add(Member(firstName: 'Harini', lastName: 'Manogarane', age: 19, gender: 'Female', status: 'Unemployed', selected: false));
    users.add(Member(firstName: 'Giridhar', lastName: 'Sampathkumar', age: 31, gender: 'Male', status: 'I.T', selected: false));
    users.add(Member(firstName: 'Joshua', lastName: 'Daniel', age: 30, gender: 'Male', status: 'Business', selected: false));
    users.add(Member(firstName: 'Srikanth', lastName: 'Dhanagopal', age: 30, gender: 'Male', status: 'Banking', selected: false));
    users.add(Member(firstName: 'Manogarane', lastName: 'Soundar', age: 56, gender: 'Male', status: 'Business', selected: false));
    users.add(Member(firstName: 'Langesan', lastName: 'Saba', age: 65, gender: 'Male', status: 'Business', selected: false));
    users.add(Member(firstName: 'Mynavathy', lastName: 'Langesan', age: 60, gender: 'Female', status: 'Home Maker', selected: false));
    users.add(Member(firstName: 'Amudha', lastName: 'Manogarane', age: 50, gender: 'Female', status: 'Home Maker', selected: false));

    return users;
  }

}