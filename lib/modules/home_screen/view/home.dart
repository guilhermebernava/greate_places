import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/modules/home_screen/widgets/place_list/place_list.dart';
import '../../../core/stores/places.dart';

class Home extends StatelessWidget {
  final String addPlaceRoute;
  const Home({Key? key, required this.addPlaceRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final placesStore = Modular.get<Places>();

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () => Modular.to.pushNamed(addPlaceRoute),
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
        body: PlaceList(
          size: size,
          placesStore: placesStore,
        ),
      ),
    );
  }
}
