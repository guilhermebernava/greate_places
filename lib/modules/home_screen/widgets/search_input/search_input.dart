import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final VoidCallback search;

  const SearchInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.search,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput>
    with TickerProviderStateMixin {
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
    return TextFormField(
      textInputAction: TextInputAction.done,
      validator: widget.validator,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.white),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        suffixIcon: IconButton(
          onPressed: widget.search,
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
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
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
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
    );
  }
}
