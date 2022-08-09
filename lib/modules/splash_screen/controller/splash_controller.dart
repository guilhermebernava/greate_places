import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  late final AnimationController animationController;
  late final AnimationController sideAnimationController;
  late final Animation<double> animation;
  late final Animation<double> sideAnimation;
  double opacityText = 0.0;
  double opacityLine = 0.0;

  SplashController(
      TickerProvider ticket, void Function(void Function() fn) setState) {
    animationController = AnimationController(
      vsync: ticket,
      duration: const Duration(seconds: 1),
    );

    sideAnimationController = AnimationController(
      vsync: ticket,
      duration: const Duration(milliseconds: 1200),
    );

    animation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    sideAnimation = Tween(begin: 0.0, end: 0.75)
        .chain(
          TweenSequence([
            TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.75), weight: 1),
            TweenSequenceItem(tween: Tween(begin: 0.75, end: 0.0), weight: 1),
            TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.75), weight: 1),
            TweenSequenceItem(tween: Tween(begin: -0.75, end: 0.0), weight: 1),
          ]),
        )
        .animate(sideAnimationController);

    animationController.forward().then((value) {
      sideAnimationController.forward().then((value) {
        setState(() {
          opacityLine = 1.0;
        });

        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          setState(() {
            opacityText = 1.0;
          });
        });
      });
      loading();
    });
  }

  static void loading() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {Modular.to.navigate('/home')});
  }
}
