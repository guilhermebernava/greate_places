import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/home_screen/home_module.dart';
import 'package:greate_places/modules/splash_screen/view/splash.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Splash.route,
          child: (_, __) => const Splash(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          HomeModule.route,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
