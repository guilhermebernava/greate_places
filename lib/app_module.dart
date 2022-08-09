import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/add_place_screen/view/add_place.dart';
import 'package:greate_places/modules/home_screen/home_module.dart';
import 'package:greate_places/modules/splash_screen/view/splash.dart';
import 'core/stores/places.dart';
import 'modules/add_place_screen/app_place_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => Places()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Splash.route,
            child: (_, __) => const Splash(),
            transition: TransitionType.fadeIn),
        ModuleRoute(
          AddPlace.route,
          module: AddPlaceModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(HomeModule.route,
            module: HomeModule(), transition: TransitionType.fadeIn),
      ];
}
