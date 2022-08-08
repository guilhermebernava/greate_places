import 'package:flutter/material.dart';
import 'package:greate_places/modules/add_place_screen/widgets/image_input.dart';
import 'package:greate_places/modules/add_place_screen/widgets/text_input.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);
  static const route = '/add-place';

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextInput(
                  controller: TextEditingController(),
                  label: 'Title',
                ),
                const ImageInput()
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outlined),
              label: const Text('Add place'),
            )
          ],
        ),
      ),
    );
  }
}
