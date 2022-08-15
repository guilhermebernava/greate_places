import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInputController {
  File? storageImage;
  bool isLoading = false;
  static const String _defaultText = 'No Image Selected';
  String text = _defaultText;
  final imagePicker = ImagePicker();

  Future<void> pickAndSaveImage(
    void Function(void Function() fn) setState,
  ) async {
    setState(() => isLoading = true);
    final image = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .timeout(const Duration(seconds: 5), onTimeout: () {
      setState(() {
        isLoading = false;
        text = 'Error in loading this image';
      });
      return null;
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
        text = 'Error in loading this image';
      });
      return null;
    });

    if (image != null) {
      // final appDir = await getApplicationDocumentsDirectory();
      // final fileName = basename(image.path);
      // final savedImagePath = '${appDir.path}/$fileName}';
      // await image.saveTo(savedImagePath);

      setState(() {
        storageImage = File(image.path);
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
