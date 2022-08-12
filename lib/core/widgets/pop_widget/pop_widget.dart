import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PopWidget extends Dismissible {
  PopWidget({
    Key? key,
    required Widget child,
    required String route,
    DismissDirection direction = DismissDirection.startToEnd,
  }) : super(
          behavior: HitTestBehavior.translucent,
          movementDuration: const Duration(milliseconds: 100),
          confirmDismiss: (direction) {
            Modular.to.navigate(route);
            return Future.value(true);
          },
          key: UniqueKey(),
          direction: direction,
          child: child,
        );
}
