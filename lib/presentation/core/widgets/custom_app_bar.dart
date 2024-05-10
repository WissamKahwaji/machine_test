import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor, width: 3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
              color: AppColors.whiteColor,
              spreadRadius: 0),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            size: 32.sp,
            color: AppColors.blackColor,
          ),
          SizedBox(
            width: 21.w,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(220.h);
}
