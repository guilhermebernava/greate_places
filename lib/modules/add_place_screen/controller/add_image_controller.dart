import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/models/place.dart';
import 'package:greate_places/core/models/place_location.dart';
import 'package:greate_places/core/repository/place_repository.dart';
import 'package:greate_places/core/services/location.dart';
import 'package:greate_places/core/services/snack_bar_services.dart';
import 'package:greate_places/modules/add_place_screen/stores/addplaces_routes.dart';
import 'package:greate_places/modules/add_place_screen/widgets/image_input/controller/image_input_controller.dart';
import '../../../core/stores/places.dart';

class AddImageController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final routes = Modular.get<AddPlacesRoutes>();

  final PlaceRepository _placeRepository;
  final ImageInputController imageInputController;
  final PlaceLocation _placeLocation = PlaceLocation(lat: 0, long: 0);
  final Places placesStore;

  AddImageController(
    this.imageInputController,
    this.placesStore,
    this._placeRepository,
  );

  String? titleValidator(String? value) {
    if (value == null) {
      return 'Title can\'t be null';
    }
    if (value.length < 5) {
      return 'Title has to be greater than 5 characters';
    }
    return null;
  }

  Future getLocation() async {
    LocationServices.myPosition().then((location) {
      if (location == null) {
        return null;
      }
      _placeLocation.lat = location.latitude!;
      _placeLocation.long = location.longitude!;
    });
  }

  void createPlace(
      void Function(void Function() fn) setState, BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (imageInputController.imagePath == '') {
      SnackBarServices()
          .showSnackBarError(context, 'Need a image to crate a place');
      return;
    }

    _placeRepository
        .create(
      Place(
        id: 0,
        title: titleController.text,
        location: _placeLocation,
        imagePath: imageInputController.imagePath,
      ),
    )
        .then((id) {
      placesStore.add(Place(
        id: id,
        title: titleController.text,
        location: _placeLocation,
        imagePath: imageInputController.imagePath,
      ));
    }).onError((error, stackTrace) {
      SnackBarServices().showSnackBarError(context, "Error in save place");
    });

    Modular.to.pop();
  }
}
