import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class SpecialAppBar extends StatelessWidget {
  final Size size;
  final Widget child;
  const SpecialAppBar({Key? key, required this.size, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.06),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
