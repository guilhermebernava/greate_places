import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/themes/app_colors.dart';
import '../controller/splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const route = '/';

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> with TickerProviderStateMixin {
  late final SplashController controller;
  @override
  void initState() {
    controller = SplashController(this, setState);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: AppColors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(color: AppColors.black),
          ),
          Container(
            width: size.width * 0.82,
            height: size.height * 0.81,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const RadialGradient(
                colors: [Color(0xff000000), Color(0xffffffff)],
                radius: 0.6,
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.8,
            decoration: const BoxDecoration(color: AppColors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: controller.animation,
                builder: (context, child) => AnimatedBuilder(
                  animation: controller.sideAnimation,
                  builder: (context, child) => Transform.rotate(
                    origin: const Offset(0, 50),
                    angle: controller.sideAnimation.value,
                    child: Icon(
                      Icons.place_rounded,
                      color: AppColors.primary,
                      size: controller.animation.value,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: controller.opacityLine,
                child: Container(
                  width: size.width * 0.05,
                  height: 5,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              AnimatedOpacity(
                opacity: controller.opacityText,
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Text(
                  'Great Places',
                  style: GoogleFonts.satisfy(fontSize: 40, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
