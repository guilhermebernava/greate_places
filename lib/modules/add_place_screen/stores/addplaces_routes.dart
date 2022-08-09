// ignore_for_file: prefer_final_fields
import 'package:mobx/mobx.dart';

part 'addplaces_routes.g.dart';

class AddPlacesRoutes = AbstractAddPlacesRoutes with _$AddPlacesRoutes;

abstract class AbstractAddPlacesRoutes with Store {
  AbstractAddPlacesRoutes(this._homeRoute);

  @readonly
  String _homeRoute = '';
}
