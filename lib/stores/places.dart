import 'package:greate_places/core/models/place.dart';
import 'package:mobx/mobx.dart';

part 'places.g.dart';

class Places = AbstractPlaces with _$Places;

abstract class AbstractPlaces with Store {
  @observable
  // ignore: prefer_final_fields
  ObservableList<Place> _places = ObservableList<Place>.of([]);

  List<Place> get places => [..._places];

  @action
  void add(Place place) {
    _places.add(place);
  }
}
