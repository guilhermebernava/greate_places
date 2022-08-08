class PlaceLocation {
  final double long;
  final double lat;
  final String address;

  PlaceLocation({
    required this.lat,
    required this.long,
    this.address = 'empty',
  });
}
