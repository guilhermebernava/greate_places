import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/stores/places.dart';
import '../place_item/place_item.dart';

class PlaceList extends StatelessWidget {
  final Size size;
  final Places placesStore;

  const PlaceList({Key? key, required this.size, required this.placesStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
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
