
class Student {

  int id;
  String name;
  String email;
  String phone;
  String course;

  Student(this.name, this.email, this.phone, this.course);

  Student.fromMap(Map map) {
    id = map['id_column'];
    name = map['name_column'];
    email = map['email_column'];
    phone = map['phone_column'];
    course = map['course_column'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "name_column": name,
      "email_column": email,
      "phone_column": phone,
      "course_column": course,
    };
    if(id !=null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Student{id: $id, name: $name, email: $email, phone: $phone, course: $course}';
  }
}