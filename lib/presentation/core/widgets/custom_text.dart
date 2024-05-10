import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600),
    );
  }
}
