import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final GlobalKey<FormFieldState> textFieldkey;
  final TextEditingController controller;
  final int? maxLines;
  final String hintText;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    required this.textFieldkey,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: textFieldkey,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: AppColors.greyColor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              14,
            ),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        hintText: hintText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        errorStyle: TextStyle(
          color: AppColors.redColor,
          fontSize: 11.sp,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
      style: const TextStyle(color: AppColors.blackColor),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      onChanged: (text) {
        textFieldkey.currentState!.validate();
      },
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'required Field';
        }

        return null;
      },
    );
  }
}
