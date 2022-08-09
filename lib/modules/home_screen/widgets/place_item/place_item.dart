import 'package:flutter/material.dart';
import 'package:greate_places/core/models/place.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.65,
          image: FileImage(
            place.image,
          ),
        ),
      ),
      child: Text(
        place.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          shadows: [Shadow()],
        ),
      ),
    );
  }
}
