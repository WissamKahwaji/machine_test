import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_test/domain/land_info/entities/land_info_model.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';
import 'package:machine_test/presentation/core/widgets/custom_clipper.dart';
import 'package:machine_test/presentation/data/land_info_data.dart';
import 'package:machine_test/presentation/location_map/map_screen.dart';

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
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 34.r, horizontal: 57.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/text_group.svg',
                  width: 59.r,
                  height: 326.r,
                ),
                SizedBox(
                  width: 31.r,
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
                            width: 0.1,
                          )),
                          child: Row(
                            children: [
                              firstContainer(),
                              SizedBox(
                                  width: 362.r,
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
                          child: Icon(
                            Icons.close,
                            color: AppColors.whiteColor,
                            size: 46.r,
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
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 18.r),
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
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(142.r, 41.r),
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
              SizedBox(
                width: 20.r,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(142.r, 41.r),
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
          SizedBox(
            height: 18.r,
          ),
        ],
      ),
    );
  }

  Row thirdContainer() {
    return Row(
      children: [
        Container(
          width: 176.r,
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
          width: 186.r,
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
              left: BorderSide(color: AppColors.whiteColor, width: 0.1))),
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
              SvgPicture.asset(
                'assets/icons/locationPin.svg',
                height: 16.r,
                width: 9.r,
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
            color: AppColors.blackColor,
            width: 75.12.r,
            height: 34.r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
          Padding(
            padding: EdgeInsets.only(
              left: 60.r,
              right: 60.r,
              top: 40.r,
              bottom: 58.r,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 10),
              decoration: BoxDecoration(
                  color: const Color(0XFF342317),
                  borderRadius: BorderRadius.circular(6.24)),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: _landInfo.imageUrl,
                    height: 127.r,
                    width: 127.r,
                  ),
                  SizedBox(
                    height: 18.r,
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
                                color: AppColors.whiteColor,
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
                        width: 30.41.r,
                        height: 30.41.r,
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
