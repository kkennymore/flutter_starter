
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:sembast/sembast_io.dart';

class DatabaseManager {

  static Future<Database> _openDatabase(String databaseName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'db', '$databaseName.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }

  static Future<int> insertMapData(String databaseName, dynamic dataValue) async {
    final Database db = await _openDatabase(databaseName);
    var store = intMapStoreFactory.store(databaseName);
    var key = await store.add(db, dataValue);
    await db.close();
    return key;
  }

  static Future<void> insertDataList(String databaseName, dynamic dataList) async {
    final Database db = await _openDatabase(databaseName);
    var store = intMapStoreFactory.store(databaseName);
    for (var dataValue in dataList) {
      await store.add(db, dataValue);
    }
    await db.close();
  }

  static Future<dynamic> selectSingleData(String databaseName, int keyValue) async {
    final Database db = await _openDatabase(databaseName);
    var store = intMapStoreFactory.store(databaseName);
    var record = await store.record(keyValue).getSnapshot(db)
        as RecordSnapshot<int, Map<String, dynamic>>;
    await db.close();
    return record.value;
  }

  static Future selectAllData(String databaseName) async {
    final Database db = await _openDatabase(databaseName);
    var store = intMapStoreFactory.store(databaseName);
    var records = await store.find(db);
    await db.close();
    return records.map((record) => record.value).toList();
  }

  static Future<void> updateData(
      String databaseName, int keyValue, dynamic newData) async {
    final Database db = await _openDatabase(databaseName);
    var store = intMapStoreFactory.store(databaseName);
    await store.record(keyValue).update(db, newData);
    await db.close();
  }

  static Future<void> deleteData(String databaseName, int keyValue) async {
    final Database db = await _openDatabase(databaseName);
    var store = intMapStoreFactory.store(databaseName);
    await store.record(keyValue).delete(db);
    await db.close();
  }

  static Future<void> deleteDatabase(String databaseName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'db', '$databaseName.db');
    await databaseFactoryIo.deleteDatabase(dbPath);
  }

  static Future<void> showDatabases() async {
    // Specify the directory where your databases are stored
    Directory databaseDirectoryPath = await getApplicationDocumentsDirectory();
    // List the databases available in the directory
    final List<FileSystemEntity> databaseFiles =
        Directory(databaseDirectoryPath.path).listSync();
    final List<String> databaseNames = [];
    for (final FileSystemEntity file in databaseFiles) {
      if (file is File && file.path.endsWith('.db')) {
        databaseNames.add(file.path.split(Platform.pathSeparator).last);
      }
    }
    for (final String name in databaseNames) {
      print(name);
    }
  }

//   // Example usage:
//   await manager.insertData('example_database', {'name': 'John', 'age': 30});
//   Map<String, dynamic>? record = await manager.selectData('example_database', 1);
//   print(record); // Output: {name: John, age: 30}

//   await manager.updateData('example_database', 1, {'age': 31});
//   record = await manager.selectData('example_database', 1);
//   print(record); // Output: {name: John, age: 31}

//   await manager.deleteData('example_database', 1);
//   record = await manager.selectData('example_database', 1);
//   print(record); // Output: null

//   await manager.deleteDatabase('example_database');
}
