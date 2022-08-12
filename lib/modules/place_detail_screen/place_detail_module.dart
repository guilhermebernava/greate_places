import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/home_screen/home_module.dart';
import 'package:greate_places/modules/place_detail_screen/stores/placedetails_routes.dart';
import 'package:greate_places/modules/place_detail_screen/view/place_detail.dart';

class PlaceDetailModule extends Module {
  static const route = '/place-detail/';

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => PlaceDetailsRoutes(HomeModule.route),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => PlaceDetail(
            place: args.data,
          ),
        ),
      ];
}
