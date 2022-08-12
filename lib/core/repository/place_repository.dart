import 'package:greate_places/core/db/db_context.dart';
import '../models/place.dart';

class PlaceRepository {
  static const createPlace =
      'CREATE TABLE Places (id INTEGER PRIMARY KEY, title TEXT, image_path TEXT, lat REAL, long REAL, address TEXT)';

  final DbContext dbContext;

  PlaceRepository(this.dbContext);

  Future<int> create(Place place) async {
    try {
      final id = await dbContext.database.transaction((txn) => txn.insert(
            'Places',
            place.toMap(),
          ));

      return id;
    } catch (e) {
      return 0;
    }
  }

  Future<int> update(Place place) async {
    final result = await dbContext.database.update('Places', place.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    try {
      final result = await dbContext.database
          .rawDelete('DELETE FROM Places WHERE id = ?', ['$id']);
      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<List<Place>> getAll() async {
    final result = <Place>[];

    final maps = await dbContext.database.rawQuery('SELECT * FROM Places');
    for (var map in maps) {
      result.add(Place.fromMap(map));
    }

    return result;
  }
}
