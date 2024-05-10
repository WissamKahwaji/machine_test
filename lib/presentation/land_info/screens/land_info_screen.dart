import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/domain/land_info/entities/land_info_model.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';
import 'package:machine_test/presentation/core/widgets/custom_clipper.dart';
import 'package:machine_test/presentation/data/land_info_data.dart';
import 'package:machine_test/presentation/location_map/map_screen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LandInfoScreen extends StatefulWidget {
  const LandInfoScreen({super.key});

  @override
  State<LandInfoScreen> createState() => _LandInfoScreenState();
}

class _LandInfoScreenState extends State<LandInfoScreen> {
  late LandInfo _landInfo;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _landInfo = landInfo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: -pi / 2,
                  child: Text(
                    'Land Info',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: CustomPaint(
                        painter: MyBorderPainter(),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: AppColors.whiteColor,
                            width: 0.2,
                          )),
                          child: Row(
                            children: [
                              firstContainer(),
                              SizedBox(
                                  width: 322.h,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          secondContainer(),
                                          thirdContainer(),
                                          forthContainer(),
                                        ],
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) {
                                                  return const MapScreen();
                                                },
                                              ));
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: AppColors.whiteColor,
                                              size: 42,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const MapScreen();
                              },
                            ));
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.whiteColor,
                            size: 42,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container forthContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(
        color: AppColors.whiteColor,
        width: 0.1,
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Token id',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                _landInfo.tokenId,
                style: const TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Token Standard',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                _landInfo.tokenStandard,
                style: const TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Chain',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                _landInfo.chain,
                style: const TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(122, 41),
                    backgroundColor: Colors.black,
                    side: const BorderSide(
                      color: AppColors.whiteColor,
                    ),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  'share',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(122, 41),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: AppColors.whiteColor,
                    ),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  'buy',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row thirdContainer() {
    return Row(
      children: [
        Container(
          width: 152.r,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(
            color: AppColors.whiteColor,
            width: 0.1,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Owner',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                _landInfo.owner,
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 170.r,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(
                    color: AppColors.whiteColor,
                    width: 0.1,
                  ),
                  bottom: BorderSide(
                    color: AppColors.whiteColor,
                    width: 0.1,
                  ),
                  top: BorderSide(
                    color: AppColors.whiteColor,
                    width: 0.1,
                  ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fownder',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                _landInfo.founder,
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget secondContainer() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(color: AppColors.whiteColor, width: 0.2))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Land # ${_landInfo.landId}',
            style: const TextStyle(fontSize: 20, color: AppColors.whiteColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: ParallelogramClipper(),
                    child: Container(
                      height: 7.54.r,
                      width: 7.54.r,
                      color: Colors.white,
                    ),
                  ),
                  ClipPath(
                    clipper: ParallelogramClipper(),
                    child: Container(
                      height: 13.45.r,
                      width: 7.45.r,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                '${_landInfo.latitude}, ${_landInfo.longitude}',
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container firstContainer() {
    return Container(
      // width: 298.w,

      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
      // decoration:
      //     const BoxDecoration(border: Border.fromBorderSide(BorderSide.none)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(9, 9, 9, 9),
            color: AppColors.blackColor,
            width: 74,
            height: 38,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/jj.png',
                  width: 9,
                  height: 15,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  _landInfo.time,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.darkGreyColor,
                  borderRadius: BorderRadius.circular(6.24)),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: _landInfo.imageUrl,
                    height: 127,
                    width: 127,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _landInfo.dimention,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            _landInfo.colorCode,
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 31,
                      ),
                      CachedNetworkImage(
                        imageUrl: _landInfo.qrcode,
                        width: 30.41,
                        height: 30.41,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
