import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/widgets/safe_button/safe_button.dart';
import 'package:greate_places/modules/add_place_screen/controller/add_image_controller.dart';
import 'package:greate_places/modules/add_place_screen/widgets/image_input/view/image_input.dart';
import 'package:greate_places/modules/add_place_screen/widgets/text_input/text_input.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);
  static const route = '/add-place';

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final AddImageController controller = Modular.get<AddImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Form(
                    key: controller.formKey,
                    child: TextInput(
                      validator: controller.titleValidator,
                      controller: controller.titleController,
                      label: 'Title',
                    ),
                  ),
                  const ImageInput()
                ],
              ),
              SafeButton(
                onTap: () {
                  controller.createPlace(setState, context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_circle_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Place',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
