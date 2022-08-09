import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/place_detail_screen/view/place_detail.dart';

class PlaceDetailModule extends Module {
  static const route = '/place-detail';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const PlaceDetail(),
        ),
      ];
}
