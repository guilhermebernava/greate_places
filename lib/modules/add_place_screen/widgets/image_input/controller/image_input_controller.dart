// ignore_for_file: avoid_print

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageInputController {
  String imagePath = '';
  bool isLoading = false;
  static const String _defaultText = 'No Image Selected';
  String text = _defaultText;
  final imagePicker = ImagePicker();

  Future<void> pickAndSaveImage(
    void Function(void Function() fn) setState,
  ) async {
    setState(
      () => isLoading = true,
    );

    final image = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return null;
    }).onError((error, stackTrace) {
      return null;
    });

    if (image != null) {
      try {
        final appDir = await getApplicationDocumentsDirectory();
        final String filePath = '${appDir.path}/${image.name}';
        await image.saveTo(filePath).catchError((_) {
          print('ERROR SAVING IMAGE');
        });

        setState(() {
          imagePath = filePath;
          isLoading = false;
        });

        return;
      } catch (e) {
        setState(() {
          imagePath = '';
          isLoading = false;
        });
      }
    }
  }
}
