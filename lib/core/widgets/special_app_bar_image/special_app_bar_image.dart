import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../themes/app_colors.dart';
import '../pop_widget/pop_widget.dart';

class SpecialAppBarImage extends StatelessWidget {
  final Size size;
  final File image;
  final String routeReturn;
  final List<Widget> children;

  const SpecialAppBarImage({
    Key? key,
    required this.size,
    required this.image,
    required this.children,
    required this.routeReturn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.07),
      child: PopWidget(
        route: routeReturn,
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
                        borderRadius: BorderRadius.circular(25),
                        child: Image.file(
                          height: size.height * 0.4,
                          width: size.width,
                          fit: BoxFit.cover,
                          image,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: BackButton(
                          color: Colors.white,
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ...children,
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
