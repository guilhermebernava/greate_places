import 'package:flutter/material.dart';
import '../../../core/themes/app_colors.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const TextInput({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  final FocusNode focusNode = FocusNode();
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isSelected = true;
        });
        animationController.forward();
      } else {
        setState(() {
          isSelected = false;
        });
        animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextField(
        focusNode: focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
          label: isSelected
              ? AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Opacity(
                    opacity: animation.value,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      child: Text(widget.label),
                    ),
                  ),
                )
              : Text(widget.label),
          focusColor: AppColors.primary,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
