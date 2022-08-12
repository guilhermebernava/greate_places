import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greate_places/core/widgets/special_app_bar_image/special_app_bar_image.dart';
import '../../../core/models/place.dart';

class PlaceDetail extends StatelessWidget {
  final Place place;
  const PlaceDetail({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SpecialAppBarImage(
          size: size,
          image: place.image,
          child: Column(
            children: [
              Text(
                place.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
