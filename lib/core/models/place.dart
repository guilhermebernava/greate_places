import 'dart:io';
import 'package:greate_places/core/models/place_location.dart';

class Place {
  final int? id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    this.id,
    required this.title,
    required this.location,
    required this.image,
  });

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      title: map['title'],
      location: PlaceLocation.fromMap(map),
      image: File(map['image_path']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'lat': location.lat,
      'long': location.long,
      'address': location.address,
      'image_path': image.path,
    };
  }
}
