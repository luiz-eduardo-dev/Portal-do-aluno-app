
import 'package:portal_do_aluno_app/model/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StudentHelper {

  final String studentTable = "studentTable";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String emailColumn = "email_column";
  final String phoneColumn = "phone_column";
  final String courseColumn = "course_column";

  static final StudentHelper _instance = StudentHelper.internal();

  factory StudentHelper() => _instance;

  StudentHelper.internal();

  Database _db;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "students.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $studentTable($idColumn INTEGER PRIMATY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $courseColumn TEXT)");
        });
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future close() async {
    Database dbStudent = await db;
    dbStudent.close();
  }

  // ignore: missing_return
  Future<Student> save(Student student) async {
    Database dbStudent = await db;
    student.id = await dbStudent.insert(studentTable, student.toMap());
  }

  Future<Student> findById(int id) async {
    Database dbStudent = await db;
    List<Map> maps = await dbStudent.query(
        studentTable,
        columns: [idColumn, nameColumn, phoneColumn, emailColumn],
        where: "$idColumn = ?",
        whereArgs: [id]
    );

    if (maps.length > 0) {
      return Student.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Student>> fetchAll() async {
    Database dbStudent = await db;
    List listMap = await dbStudent.query(
        studentTable,
        columns: [idColumn, nameColumn, phoneColumn, emailColumn],
    );

    List<Student> listStudent = [];
    for(Map map in listMap) {
      listStudent.add(Student.fromMap(map));
    }

    if(listStudent.isNotEmpty) {
      return listStudent;
    }else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    Database dbStudent = await db;
    return await dbStudent.delete(
        studentTable,
        where: "$idColumn = ?",
        whereArgs: [id]
    );
    }

  Future<int> update(Student student) async {
    Database dbStudent = await db;
    return await dbStudent.update(
        studentTable,
        student.toMap(),
        where: "$idColumn = ?",
        whereArgs: [student.id]
    );
  }

  Future<int> getSize() async {
    Database dbStudent = await db;
    return Sqflite.firstIntValue(await dbStudent.rawQuery('select count(*) from $studentTable'));
  }
}