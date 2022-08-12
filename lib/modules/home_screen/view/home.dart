import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/services/location.dart';
import 'package:greate_places/core/widgets/loading_widget/loading_widget.dart';
import 'package:greate_places/core/widgets/white_status_bar/white_status_bar.dart';
import 'package:greate_places/modules/home_screen/widgets/place_list/place_list.dart';
import '../../../core/stores/places.dart';
import '../widgets/home_app_bar/home_app_bar.dart';

class Home extends StatelessWidget {
  final String addPlaceRoute;
  final String placeDetailRoute;

  const Home({
    Key? key,
    required this.addPlaceRoute,
    required this.placeDetailRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final placesStore = Modular.get<Places>();

    return FutureBuilder(
        future: LocationServices().determinePosition(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const LoadingWidget();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return WhiteStatusBar(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Scaffold(
                    appBar: HomeAppBar(
                      size: size,
                      addPlaceRoute: addPlaceRoute,
                      text: snapshot.data as String,
                    ),
                    body: FutureBuilder(
                      future: placesStore.getAll(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            break;
                          case ConnectionState.waiting:
                            return const LoadingWidget();
                          case ConnectionState.active:
                            break;
                          case ConnectionState.done:
                            return PlaceList(
                              size: size,
                              placesStore: placesStore,
                            );
                        }
                        return const LoadingWidget();
                      },
                    ),
                  ),
                ),
              );
          }

          return const LoadingWidget();
        });
  }
}
