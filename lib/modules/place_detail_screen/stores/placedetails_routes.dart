// ignore_for_file: prefer_final_fields
import 'package:mobx/mobx.dart';

part 'placedetails_routes.g.dart';

class PlaceDetailsRoutes = AbstractplacedetailsRoutes with _$PlaceDetailsRoutes;

abstract class AbstractplacedetailsRoutes with Store {
  AbstractplacedetailsRoutes(this._homeRoute);

  @readonly
  String _homeRoute = '';
}
