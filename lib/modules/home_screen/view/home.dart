import 'package:flutter/material.dart';
import 'package:greate_places/core/widgets/white_status_bar/white_status_bar.dart';
import 'package:greate_places/modules/home_screen/controllers/home_controller.dart';
import 'package:greate_places/modules/home_screen/widgets/place_list/view/place_list.dart';
import '../widgets/home_app_bar/home_app_bar.dart';

class Home extends StatelessWidget {
  final String addPlaceRoute;
  final String placeDetailRoute;
  final String myLocation;

  const Home({
    Key? key,
    required this.addPlaceRoute,
    required this.placeDetailRoute,
    required this.myLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WhiteStatusBar(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Scaffold(
          appBar: HomeAppBar(
            controller: HomeController(),
            size: size,
            addPlaceRoute: addPlaceRoute,
            text: myLocation,
          ),
          body: PlaceList(
            size: size,
          ),
        ),
      ),
    );
  }
}
