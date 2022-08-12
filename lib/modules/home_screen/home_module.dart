import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/add_place_screen/app_place_module.dart';
import 'package:greate_places/modules/home_screen/stores/home_routes.dart';
import 'package:greate_places/modules/home_screen/view/home.dart';
import 'package:greate_places/modules/place_detail_screen/place_detail_module.dart';

class HomeModule extends Module {
  static const route = '/home/';

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => HomeRoutes(
            AddPlaceModule.route,
            PlaceDetailModule.route,
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const Home(
            addPlaceRoute: AddPlaceModule.route,
            placeDetailRoute: PlaceDetailModule.route,
          ),
        ),
      ];
}
