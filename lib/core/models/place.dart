import 'package:greate_places/core/models/place_location.dart';

class Place {
  final int? id;
  final String title;
  final PlaceLocation location;
  final String imagePath;

  Place({
    this.id,
    required this.title,
    required this.location,
    required this.imagePath,
  });

  factory Place.fromMap(Map<String, dynamic> map) {
    try {
      return Place(
        id: map['id'],
        title: map['title'],
        location: PlaceLocation.fromMap(map),
        imagePath: map['image_path'],
      );
    } catch (e) {
      return Place(
        title: '',
        location: PlaceLocation(lat: 0, long: 0),
        imagePath: '',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'lat': location.lat,
      'long': location.long,
      'address': location.address,
      'image_path': imagePath,
    };
  }
}
