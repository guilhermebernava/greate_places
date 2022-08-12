import 'package:flutter/material.dart';
import 'package:greate_places/core/themes/app_colors.dart';

class SafeButton extends StatefulWidget {
  final Color color;
  final VoidCallback onTap;
  final Widget child;
  final int duration;
  final double? width;
  final double? height;

  const SafeButton({
    Key? key,
    this.color = AppColors.secundary,
    this.duration = 3,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<SafeButton> createState() => _SafeButtonState();
}

class _SafeButtonState extends State<SafeButton> {
  bool _canClick = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          if (_canClick) {
            widget.onTap();
            setState(() {
              _canClick = false;
            });
          }
          Future.delayed(
            Duration(seconds: widget.duration),
          ).then((value) {
            setState(() {
              _canClick = true;
            });
          });
        },
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.color,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
