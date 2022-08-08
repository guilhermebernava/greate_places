import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/add_place_screen/view/add_place.dart';
import 'package:greate_places/modules/home_screen/view/home.dart';

class HomeModule extends Module {
  static const route = '/home';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Home.route,
          child: (_, __) => const Home(
            addPlaceRoute: AddPlace.route,
          ),
        ),
      ];
}
