import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storagedImage = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: _storagedImage != null
              ? Image.file(
                  _storagedImage!,
                  fit: BoxFit.cover,
                )
              : const Text('No Image Selected'),
        ),
        ElevatedButton(
          onPressed: () async {
            final image = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );

            if (image != null) {
              final appDir = await getApplicationDocumentsDirectory();
              final fileName = basename(image.path);
              final savedImage =
                  await image.saveTo('${appDir.path}/$fileName}');

              setState(() {
                _storagedImage = File(image.path);
              });
            }
          },
          child: const Icon(
            Icons.add_a_photo_rounded,
          ),
        )
      ],
    );
  }
}
