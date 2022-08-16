import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/themes/app_colors.dart';
import 'package:greate_places/core/widgets/refresh_screen/refresh_screen.dart';
import 'package:greate_places/modules/home_screen/widgets/place_list/controller/place_list_controller.dart';
import '../../place_item/place_item.dart';

class PlaceList extends StatelessWidget {
  final Size size;

  const PlaceList({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<PlaceListController>();

    return RefreshScreen(
      onRefresh: () async {
        await controller.onRefresh();
      },
      child: Container(
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
                  controller.placesStore.filtredPlaces.isEmpty
                      ? PlaceItem(
                          place: controller.placesStore.places[index],
                          size: size,
                        )
                      : PlaceItem(
                          place: controller.placesStore.filtredPlaces[index],
                          size: size,
                        ),
              itemCount: controller.placesStore.filtredPlaces.isEmpty
                  ? controller.placesStore.places.length
                  : controller.placesStore.filtredPlaces.length,
            ),
          ),
        ),
      ),
    );
  }
}
