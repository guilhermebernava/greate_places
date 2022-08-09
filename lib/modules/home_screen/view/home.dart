import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/themes/app_colors.dart';
import 'package:greate_places/modules/home_screen/widgets/place_list/place_list.dart';
import '../../../core/stores/places.dart';

class Home extends StatelessWidget {
  final String addPlaceRoute;
  final String placeDetailRoute;

  const Home({
    Key? key,
    required this.addPlaceRoute,
    required this.placeDetailRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final placesStore = Modular.get<Places>();

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: size,
          child: Container(
            height: size.height * 0.2,
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Modular.to.pushNamed(addPlaceRoute),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PlaceList(
          size: size,
          placesStore: placesStore,
        ),
      ),
    );
  }
}
