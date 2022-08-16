import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/models/place.dart';
import 'package:greate_places/core/themes/app_colors.dart';
import 'package:greate_places/core/themes/app_text_style.dart';
import 'package:greate_places/core/widgets/error_image/error_image.dart';
import 'package:greate_places/core/widgets/safe_button/safe_button.dart';
import 'package:greate_places/modules/home_screen/stores/home_routes.dart';
import '../../../../core/stores/places.dart';

class PlaceItem extends StatelessWidget {
  final Place place;
  final Size size;

  const PlaceItem({
    Key? key,
    required this.place,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = Modular.get<HomeRoutes>();
    final placesStore = Modular.get<Places>();

    return GestureDetector(
      onLongPress: () {
        HapticFeedback.mediumImpact();
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            contentPadding: const EdgeInsets.all(12.0),
            title: Text(
              place.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.black,
            children: [
              SafeButton(
                onTap: () {
                  placesStore.delete(place.id!);
                  Modular.to.pop();
                },
                child: const Text(
                  'Delete',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      },
      onTap: () => Modular.to.pushNamed(
        routes.placeDetailRoute,
        arguments: place,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            onError: (error, stackTrace) => const ErrorImage(),
            fit: BoxFit.cover,
            opacity: 0.65,
            image: FileImage(
              File(place.imagePath),
            ),
          ),
        ),
        child: Text(
          place.title,
          style: AppTextStyle.placeItem,
        ),
      ),
    );
  }
}
