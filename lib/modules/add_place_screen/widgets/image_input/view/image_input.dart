import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/widgets/loading_widget/loading_widget.dart';
import 'package:greate_places/core/widgets/safe_button/safe_button.dart';
import 'package:greate_places/modules/add_place_screen/widgets/image_input/controller/image_input_controller.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final controller = Modular.get<ImageInputController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.4,
          child: controller.isLoading
              ? const LoadingWidget()
              : controller.storageImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        controller.storageImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Center(
                      child: Text(
                        'No Image Selected',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
        ),
        SafeButton(
          width: size.width,
          height: size.height * 0.08,
          onTap: () async {
            await controller.pickAndSaveImage(setState);
          },
          child: const Icon(
            Icons.add_a_photo_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
    );
  }
}
