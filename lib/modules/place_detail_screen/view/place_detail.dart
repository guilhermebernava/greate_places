import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/widgets/special_app_bar_image/special_app_bar_image.dart';
import 'package:greate_places/core/widgets/white_status_bar/white_status_bar.dart';
import '../../../core/models/place.dart';
import '../stores/placedetails_routes.dart';

class PlaceDetail extends StatelessWidget {
  final Place place;
  const PlaceDetail({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final routes = Modular.get<PlaceDetailsRoutes>();

    return WhiteStatusBar(
      child: Scaffold(
        body: SpecialAppBarImage(
          routeReturn: routes.homeRoute,
          size: size,
          image: place.image,
          children: [
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
