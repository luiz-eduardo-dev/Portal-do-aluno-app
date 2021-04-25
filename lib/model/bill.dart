
class Bill {

  int id;
  String name;
  String value;
  String date;

  Bill(this.name, this.date, this.value);

  Bill.fromMap(Map map) {
    id = map['id_column'];
    name = map['name_column'];
    value = map['value_column'];
    date = map['date_column'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "name_column": name,
      "value_column": value,
      "date_column": date,
    };
    if(id !=null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Certificate{id: $id, name: $name, value: $value, date: $date}';
  }
}