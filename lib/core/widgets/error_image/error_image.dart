import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 70.0),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 75,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
