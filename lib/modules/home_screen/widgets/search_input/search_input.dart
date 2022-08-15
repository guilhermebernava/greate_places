import 'package:flutter/material.dart';
import 'package:greate_places/core/themes/app_text_style.dart';
import '../../../../core/themes/app_colors.dart';

class SearchInput extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) {
        search();
      },
      validator: validator,
      style: AppTextStyle.textInput,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        suffixIcon: IconButton(
          onPressed: search,
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
        label: Text(label),
        focusColor: AppColors.primary,
        labelStyle: AppTextStyle.textInputLabel,
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
