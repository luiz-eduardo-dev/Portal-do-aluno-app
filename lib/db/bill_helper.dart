
import 'package:portal_do_aluno_app/model/bill.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BillHelper {

  final String billTable = "billTable";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String valueColumn = "value_column";
  final String dateColumn = "date_column";


  static final BillHelper _instance = BillHelper.internal();

  factory BillHelper() => _instance;

  BillHelper.internal();

  Database _db;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "bills.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $billTable($idColumn INTEGER PRIMATY KEY, $nameColumn TEXT, $valueColumn TEXT, $dateColumn TEXT)");
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
    Database dbBill = await db;
    dbBill.close();
  }

  // ignore: missing_return
  Future<Bill> save(Bill bill) async {
    Database dbBill = await db;
    bill.id = await dbBill.insert(billTable, bill.toMap());
  }

  Future<Bill> findById(int id) async {
    Database dbBill = await db;
    List<Map> maps = await dbBill.query(
        billTable,
        columns: [idColumn, nameColumn, valueColumn, dateColumn],
        where: "$idColumn = ?",
        whereArgs: [id]
    );

    if (maps.length > 0) {
      return Bill.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Bill>> fetchAll() async {
    Database dbBill = await db;
    List listMap = await dbBill.query(
      billTable,
      columns: [idColumn, nameColumn, valueColumn, dateColumn],
    );

    List<Bill> listBill = [];
    for(Map map in listMap) {
      listBill.add(Bill.fromMap(map));
    }

    if(listBill.isNotEmpty) {
      return listBill;
    }else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    Database dbBill = await db;
    return await dbBill.delete(
        billTable,
        where: "$idColumn = ?",
        whereArgs: [id]
    );
  }

  Future<int> update(Bill bill) async {
    Database dbBill = await db;
    return await dbBill.update(
        billTable,
        bill.toMap(),
        where: "$idColumn = ?",
        whereArgs: [bill.id]
    );
  }

  Future<int> getSize() async {
    Database dbBill = await db;
    return Sqflite.firstIntValue(await dbBill.rawQuery('select count(*) from $billTable'));
  }
}