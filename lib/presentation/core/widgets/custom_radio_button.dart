import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

Widget customRadioButton(
    {required String text,
    required int index,
    required Color color,
    required Function(int index) onTap,
    required int value}) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
              border: (value == index)
                  ? Border.all(color: AppColors.primaryColor, width: 7)
                  : null,
              borderRadius: BorderRadius.circular(200),
              color: AppColors.greyColor),
        ),
      ),
      SizedBox(
        width: 6.w,
      ),
      Container(
        width: 13.w,
        height: 13.h,
        padding: const EdgeInsets.all(2.6),
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
        ),
        child: Container(
          width: 7.6.w,
          height: 7.6.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: color),
        ),
      ),
      const SizedBox(
        width: 12,
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      )
    ],
  );
}
