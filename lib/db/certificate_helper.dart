
import 'package:portal_do_aluno_app/model/certificate.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CertificateHelper {

  final String certificateTable = "CertificateTable";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String courseColumn = "course_column";


  static final CertificateHelper _instance = CertificateHelper.internal();

  factory CertificateHelper() => _instance;

  CertificateHelper.internal();

  Database _db;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "certificates.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $certificateTable($idColumn INTEGER PRIMATY KEY, $nameColumn TEXT, $courseColumn TEXT)");
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
    Database dbCertificate = await db;
    dbCertificate.close();
  }

  // ignore: missing_return
  Future<Certificate> save(Certificate certificate) async {
    Database dbCertificate = await db;
    certificate.id = await dbCertificate.insert(certificateTable, certificate.toMap());
  }

  Future<Certificate> findById(int id) async {
    Database dbCertificate = await db;
    List<Map> maps = await dbCertificate.query(
        certificateTable,
        columns: [idColumn, nameColumn, courseColumn],
        where: "$idColumn = ?",
        whereArgs: [id]
    );

    if (maps.length > 0) {
      return Certificate.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Certificate>> fetchAll() async {
    Database dbCertificate = await db;
    List listMap = await dbCertificate.query(
      certificateTable,
      columns: [idColumn, nameColumn, courseColumn],
    );

    List<Certificate> listCertificate = [];
    for(Map map in listMap) {
      listCertificate.add(Certificate.fromMap(map));
    }

    if(listCertificate.isNotEmpty) {
      return listCertificate;
    }else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    Database dbCertificate = await db;
    return await dbCertificate.delete(
        certificateTable,
        where: "$idColumn = ?",
        whereArgs: [id]
    );
  }

  Future<int> update(Certificate certificate) async {
    Database dbCertificate = await db;
    return await dbCertificate.update(
        certificateTable,
        certificate.toMap(),
        where: "$idColumn = ?",
        whereArgs: [certificate.id]
    );
  }

  Future<int> getSize() async {
    Database dbCertificate = await db;
    return Sqflite.firstIntValue(await dbCertificate.rawQuery('select count(*) from $certificateTable'));
  }
}