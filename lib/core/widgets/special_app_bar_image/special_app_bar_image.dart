import 'dart:io';

import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class SpecialAppBarImage extends StatelessWidget {
  final Size size;
  final File image;
  final Widget child;

  const SpecialAppBarImage({
    Key? key,
    required this.size,
    required this.image,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.07),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const BackButton(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
