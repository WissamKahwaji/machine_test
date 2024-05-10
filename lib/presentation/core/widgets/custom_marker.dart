import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

Widget customMarker() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 31.64.w,
        height: 31.64.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 9),
            borderRadius: BorderRadius.circular(200),
            color: AppColors.greyColor),
      ),
      Container(
        width: 3.16.w,
        height: 24.52.h,
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(9))),
      ),
    ],
  );
}
