import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Size? fixedSize;
  final String title;
  const CustomButton(
      {super.key, this.onPressed, this.fixedSize, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          fixedSize: fixedSize,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(vertical: 18)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
