// ignore_for_file: prefer_final_fields
import 'package:greate_places/core/models/place.dart';
import 'package:mobx/mobx.dart';

part 'places.g.dart';

class Places = AbstractPlaces with _$Places;

abstract class AbstractPlaces with Store {
  @readonly
  ObservableList<Place> _places = ObservableList<Place>.of([]);

  @action
  void add(Place place) {
    _places.add(place);
  }
}
