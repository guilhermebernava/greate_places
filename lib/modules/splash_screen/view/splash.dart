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
    return Material(
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller.animation,
            builder: (context, child) => AnimatedBuilder(
              animation: controller.sideAnimation,
              builder: (context, child) => Transform.rotate(
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
            duration: const Duration(milliseconds: 300),
            opacity: controller.opacity,
            child: Container(
              width: 30,
              height: 5,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedOpacity(
            opacity: controller.opacity,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubicEmphasized,
            child: Text(
              'Great Places',
              style: GoogleFonts.satisfy(fontSize: 40, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
