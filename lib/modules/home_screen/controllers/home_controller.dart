import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/stores/places.dart';

class HomeController {
  final searchController = TextEditingController();
  final placesStores = Modular.get<Places>();

  void filterPlaces() {
    placesStores.filterPlaces(searchController.text);
  }
}
