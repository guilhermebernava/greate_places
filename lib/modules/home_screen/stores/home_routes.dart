// ignore_for_file: prefer_final_fields
import 'package:mobx/mobx.dart';

part 'home_routes.g.dart';

class HomeRoutes = AbstractHomeRoutes with _$HomeRoutes;

abstract class AbstractHomeRoutes with Store {
  AbstractHomeRoutes(this._addPlaceRoute, this._placeDetailRoute);

  @readonly
  String _placeDetailRoute = '';

  @readonly
  String _addPlaceRoute = '';
}
