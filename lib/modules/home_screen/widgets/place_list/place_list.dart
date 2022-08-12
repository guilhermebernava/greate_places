import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:greate_places/core/themes/app_colors.dart';
import '../../../../core/stores/places.dart';
import '../place_item/place_item.dart';

class PlaceList extends StatelessWidget {
  final Size size;
  final Places placesStore;

  const PlaceList({
    Key? key,
    required this.size,
    required this.placesStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: AppColors.black,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.04,
          left: 10,
          right: 10,
        ),
        child: Observer(
          builder: (_) => ListView.builder(
            itemBuilder: (context, index) =>
                PlaceItem(place: placesStore.places[index], size: size),
            itemCount: placesStore.places.length,
          ),
        ),
      ),
    );
  }
}
