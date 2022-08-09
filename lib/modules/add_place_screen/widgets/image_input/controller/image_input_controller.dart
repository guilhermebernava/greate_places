import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageInputController {
  File? storageImage;
  bool isLoading = false;
  final imagePicker = ImagePicker();

  Future<void> pickAndSaveImage(
    void Function(void Function() fn) setState,
  ) async {
    setState(() => isLoading = true);
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = basename(image.path);
      final savedImagePath = '${appDir.path}/$fileName}';
      await image.saveTo(savedImagePath);

      setState(() {
        storageImage = File(savedImagePath);
        isLoading = false;
      });
      return;
    }

    setState(() {
      storageImage = null;
      isLoading = false;
    });
  }
}