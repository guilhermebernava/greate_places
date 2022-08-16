import '../../../../../core/stores/places.dart';

class PlaceListController {
  final Places placesStore;

  PlaceListController(this.placesStore);

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    placesStore.clearFilter();
    await placesStore.getAll();
    return;
  }
}
