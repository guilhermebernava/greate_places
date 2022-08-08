import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  late final AnimationController animationController;
  late final AnimationController sideAnimationController;
  late final Animation<double> animation;
  late final Animation<double> sideAnimation;

  SplashController(
      TickerProvider ticket, void Function(void Function() fn) setState) {
    animationController = AnimationController(
      vsync: ticket,
      duration: const Duration(seconds: 2),
    );

    sideAnimationController = AnimationController(
      vsync: ticket,
      duration: const Duration(seconds: 2),
    );

    animation = Tween(begin: 0.0, end: 120.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    sideAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(
          TweenSequence([
            TweenSequenceItem(tween: Tween(begin: 0.0, end: 1), weight: 1),
            TweenSequenceItem(tween: Tween(begin: 1, end: 0.0), weight: 1),
            TweenSequenceItem(tween: Tween(begin: 0.0, end: -1), weight: 1),
            TweenSequenceItem(tween: Tween(begin: -1, end: 0.0), weight: 1),
          ]),
        )
        .animate(sideAnimationController);

    animationController.forward().then((value) {
      sideAnimationController.forward().then((value) {
        setState(() {
          opacity = 1.0;
        });
      });
      loading();
    });
  }

  double opacity = 0.0;
  static void loading() {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => {Modular.to.navigate('/home')});
  }
}
