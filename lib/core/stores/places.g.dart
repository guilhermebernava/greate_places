// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Places on AbstractPlaces, Store {
  late final _$_placesAtom =
      Atom(name: 'AbstractPlaces._places', context: context);

  ObservableList<Place> get places {
    _$_placesAtom.reportRead();
    return super._places;
  }

  @override
  ObservableList<Place> get _places => places;

  @override
  set _places(ObservableList<Place> value) {
    _$_placesAtom.reportWrite(value, super._places, () {
      super._places = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('AbstractPlaces.getAll', context: context);

  @override
  Future<dynamic> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$AbstractPlacesActionController =
      ActionController(name: 'AbstractPlaces', context: context);

  @override
  void filterPlaces(String text) {
    final _$actionInfo = _$AbstractPlacesActionController.startAction(
        name: 'AbstractPlaces.filterPlaces');
    try {
      return super.filterPlaces(text);
    } finally {
      _$AbstractPlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(int id) {
    final _$actionInfo = _$AbstractPlacesActionController.startAction(
        name: 'AbstractPlaces.delete');
    try {
      return super.delete(id);
    } finally {
      _$AbstractPlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(Place place) {
    final _$actionInfo = _$AbstractPlacesActionController.startAction(
        name: 'AbstractPlaces.add');
    try {
      return super.add(place);
    } finally {
      _$AbstractPlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
