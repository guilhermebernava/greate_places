import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/themes/app_colors.dart';
import 'package:greate_places/core/widgets/pop_widget/pop_widget.dart';
import 'package:greate_places/core/widgets/safe_button/safe_button.dart';
import 'package:greate_places/core/widgets/special_app_bar/special_app_bar.dart';
import 'package:greate_places/core/widgets/white_status_bar/white_status_bar.dart';
import 'package:greate_places/modules/add_place_screen/controller/add_image_controller.dart';
import 'package:greate_places/modules/add_place_screen/widgets/image_input/view/image_input.dart';
import 'package:greate_places/modules/add_place_screen/widgets/text_input/text_input.dart';

import '../stores/addplaces_routes.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final AddImageController controller = Modular.get<AddImageController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final routes = Modular.get<AddPlacesRoutes>();

    return WhiteStatusBar(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: PopWidget(
          route: routes.homeRoute,
          direction: DismissDirection.endToStart,
          child: SpecialAppBar(
            size: size,
            child: Column(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
