// ignore_for_file: prefer_final_fields
import 'package:greate_places/core/models/place.dart';
import 'package:greate_places/core/repository/place_repository.dart';
import 'package:mobx/mobx.dart';

part 'places.g.dart';

class Places = AbstractPlaces with _$Places;

abstract class AbstractPlaces with Store {
  @readonly
  ObservableList<Place> _places = ObservableList<Place>.of([]);
  ObservableList<Place> _filtredPlaces = ObservableList<Place>.of([]);
  ObservableList<Place> get filtredPlaces => _filtredPlaces;

  final PlaceRepository _placeRepository;

  AbstractPlaces(this._placeRepository) {
    getAll();
  }

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
  void clearFilter() {
    _filtredPlaces.clear();
  }

  @action
  void filterPlaces(String text) {
    clearFilter();
    if (text == '') {
      clearFilter();
      return;
    }

    final filtred = _places.where((element) => element.title == text);

    if (filtred.isNotEmpty) {
      for (var place in filtred) {
        if (_filtredPlaces.any((element) => element.id == place.id)) {
          continue;
        }
        _filtredPlaces.add(place);
      }
    }
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
