import 'package:flutter/material.dart';
import 'package:greate_places/core/repository/place_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbContext {
  late final Database _database;

  Database get database => _database;

  DbContext() {
    try {
      getDatabasesPath().then((databasesPath) async {
        _createDb(join(databasesPath, 'great-places.db'))
            .then((db) => _database = db);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Database> _createDb(String path) async {
    final database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(PlaceRepository.createPlace);
    });
    return database;
  }
}
