import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/stores/places.dart';
import 'package:greate_places/core/themes/app_colors.dart';
import '../place_item/place_item.dart';

class PlaceList extends StatelessWidget {
  final Size size;

  const PlaceList({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placesStore = Modular.get<Places>();
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
            itemBuilder: (context, index) => placesStore.filtredPlaces.isEmpty
                ? PlaceItem(
                    place: placesStore.places[index],
                    size: size,
                  )
                : PlaceItem(
                    place: placesStore.filtredPlaces[index],
                    size: size,
                  ),
            itemCount: placesStore.filtredPlaces.isEmpty
                ? placesStore.places.length
                : placesStore.filtredPlaces.length,
          ),
        ),
      ),
    );
  }
}
