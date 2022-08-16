import 'package:flutter/material.dart';
import 'package:greate_places/core/repository/place_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbContext {
  Future<Database?> getDb() async {
    try {
      final databasesPath = await getDatabasesPath();
      final db = await _createDb(join(databasesPath, 'great-places.db'));
      return db;
    } catch (e) {
      debugPrint(e.toString());
      return null;
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
