import 'package:flutter/material.dart';

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';

Widget buildImageContainer({
  required BuildContext context,
  File? selectedImage,
  String? imgUrl,
  void Function()? onDeleteTap,
  void Function()? onGalleryTap,
  void Function()? onCameraTap,
}) {
  return GestureDetector(
    onTap: () {
      _showImageSourceOptions(context, onDeleteTap, onGalleryTap, onCameraTap);
    },
    child: DottedBorder(
      dashPattern: const [6],
      borderType: BorderType.RRect,
      color: AppColors.darkGreyColor,
      strokeWidth: 3,
      radius: const Radius.circular(10),
      child: Container(
        height: 156.h,
        width: 255.w,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            selectedImage != null
                ? Image.file(
                    selectedImage,
                    height: 150.h,
                    width: 200.w,
                    fit: BoxFit.cover,
                  )
                : imgUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imgUrl,
                        height: 150.h,
                        width: 200.w,
                        fit: BoxFit.cover,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 26.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Add product image',
                            style: TextStyle(
                                color: AppColors.darkGreyColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
            selectedImage != null || imgUrl != null
                ? Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: onDeleteTap,
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ),
  );
}

void _showImageSourceOptions(
  BuildContext context,
  void Function()? onDeleteTap,
  void Function()? onGalleryTap,
  void Function()? onCameraTap,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: onGalleryTap,
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: onCameraTap,
            ),
          ],
        ),
      );
    },
  );
}

void showImageSelectionAlert({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: 1.0,
        child: AlertDialog(
          title: Text(
            'Image Required',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          content: Text(
            'Please select an image for the lesson.',
            style: TextStyle(fontSize: 16.sp),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
