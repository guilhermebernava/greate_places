import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/services/location.dart';
import 'package:greate_places/core/stores/places.dart';
import 'package:greate_places/core/widgets/loading_widget/loading_widget.dart';
import 'package:greate_places/modules/add_place_screen/app_place_module.dart';
import 'package:greate_places/modules/home_screen/stores/home_routes.dart';
import 'package:greate_places/modules/home_screen/view/home.dart';
import 'package:greate_places/modules/place_detail_screen/place_detail_module.dart';

import 'widgets/place_list/controller/place_list_controller.dart';

class HomeModule extends Module {
  static const route = '/home/';

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => HomeRoutes(
            AddPlaceModule.route,
            PlaceDetailModule.route,
          ),
        ),
        Bind.singleton(
          (i) => PlaceListController(i.get<Places>()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => FutureBuilder(
              future: LocationServices.myLocationAddress(),
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return const LoadingWidget();
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    return Home(
                      addPlaceRoute: AddPlaceModule.route,
                      placeDetailRoute: PlaceDetailModule.route,
                      myLocation: snapshot.data == null
                          ? 'empty'
                          : snapshot.data as String,
                    );
                }
                return const Center(
                  child: Text(
                    'ERROR',
                    style: TextStyle(color: Colors.red, fontSize: 50),
                  ),
                );
              }),
        ),
      ];
}
