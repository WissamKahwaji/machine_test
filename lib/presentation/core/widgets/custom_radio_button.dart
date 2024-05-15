import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

Widget customRadioButton(
    {required String text,
    required int index,
    required String svgIcon,
    required Function(int index) onTap,
    required int value}) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          width: 24.r,
          height: 24.r,
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
      SvgPicture.asset(
        svgIcon,
        width: 13.r,
        height: 13.r,
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
