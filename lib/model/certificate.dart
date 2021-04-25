
class Certificate {

  int id;
  String name;
  String course;

  Certificate(this.name, this.course);

  Certificate.fromMap(Map map) {
    id = map['id_column'];
    name = map['name_column'];
    course = map['course_column'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "name_column": name,
      "course_column": course,
    };
    if(id !=null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Certificate{id: $id, name: $name, course: $course}';
  }
}