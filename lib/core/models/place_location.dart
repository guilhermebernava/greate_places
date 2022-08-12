class PlaceLocation {
  final double long;
  final double lat;
  final String address;

  PlaceLocation({
    required this.lat,
    required this.long,
    this.address = 'empty',
  });

  factory PlaceLocation.fromMap(Map<String, dynamic> map) {
    return PlaceLocation(
      lat: map['lat'],
      long: map['long'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
      'address': address,
    };
  }
}
