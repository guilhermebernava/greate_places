import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/stores/places.dart';

class Home extends StatelessWidget {
  final String addPlaceRoute;
  const Home({Key? key, required this.addPlaceRoute}) : super(key: key);
  static const route = '/';

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
        body: SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                Text(placesStore.places[index].title),
            itemCount: placesStore.places.length,
          ),
        ),
      ),
    );
  }
}
