import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/add_place_screen/controller/add_image_controller.dart';
import 'package:greate_places/modules/add_place_screen/stores/addplaces_routes.dart';
import 'package:greate_places/modules/add_place_screen/view/add_place.dart';
import 'package:greate_places/modules/add_place_screen/widgets/image_input/controller/image_input_controller.dart';
import 'package:greate_places/modules/home_screen/home_module.dart';
import '../../core/stores/places.dart';

class AddPlaceModule extends Module {
  static const route = '/add-place';

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ImageInputController()),
        Bind.singleton((i) =>
            AddImageController(i.get<ImageInputController>(), i.get<Places>())),
        Bind.singleton((i) => AddPlacesRoutes(HomeModule.route)),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const AddPlace(),
        ),
      ];
}
