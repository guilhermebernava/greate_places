// ignore_for_file: prefer_final_fields
import 'package:greate_places/core/models/place.dart';
import 'package:greate_places/core/repository/place_repository.dart';
import 'package:mobx/mobx.dart';

part 'places.g.dart';

class Places = AbstractPlaces with _$Places;

abstract class AbstractPlaces with Store {
  @readonly
  ObservableList<Place> _places = ObservableList<Place>.of([]);
  final PlaceRepository _placeRepository;

  AbstractPlaces(this._placeRepository);

  @action
  Future getAll() async {
    final list = await _placeRepository.getAll();
    final addList = <Place>[];

    for (var item in list) {
      if (_places.any((element) => element.id == item.id)) {
        continue;
      }
      addList.add(item);
    }

    _places.addAll(addList);
  }

  @action
  void delete(int id) {
    _placeRepository.delete(id).then((value) {
      _places.removeWhere((element) => element.id == id);
    });
  }

  @action
  void add(Place place) {
    _places.add(place);
  }
}
