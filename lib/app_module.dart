import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/db/db_context.dart';
import 'package:greate_places/core/repository/place_repository.dart';
import 'package:greate_places/modules/home_screen/home_module.dart';
import 'package:greate_places/modules/place_detail_screen/place_detail_module.dart';
import 'package:greate_places/modules/splash_screen/view/splash.dart';
import 'core/stores/places.dart';
import 'modules/add_place_screen/app_place_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => DbContext()),
        Bind.singleton((i) => PlaceRepository(i.get<DbContext>())),
        Bind.singleton((i) => Places(i.get<PlaceRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Splash.route,
            child: (_, __) => const Splash(),
            transition: TransitionType.fadeIn),
        ModuleRoute(
          AddPlaceModule.route,
          module: AddPlaceModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(
          HomeModule.route,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          PlaceDetailModule.route,
          module: PlaceDetailModule(),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
