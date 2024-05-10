import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:machine_test/injection.dart';
import 'package:machine_test/presentation/add_item/screens/add_item_screen.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';
import 'package:machine_test/presentation/core/widgets/custom_btn.dart';
import 'package:machine_test/presentation/core/widgets/custom_marker.dart';
import 'package:machine_test/presentation/location_map/blocs/location_bloc/location_bloc_bloc.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController _searchController = TextEditingController();
  final locationBloc = getIt<LocationBlocBloc>();

  Set<Marker> markers = {};
  late LatLng _defaultLatLng;
  LatLng _draggedLatLng = const LatLng(37.42796133580664, -122.085749655962);

  CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service is not disabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission are permenently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future _goToUserCurrentPosition() async {
    Position currentPosition = await _determinePosition();
    _defaultLatLng =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    _goToSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  Future _goToSpecificPosition(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 17)));

    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude)));

    setState(() {});
  }

  Widget buildBackIcon() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(200),
      ),
      child: GestureDetector(
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.blackColor,
          size: 32,
        ),
      ),
    );
  }

  Widget showLocation() {
    return Stack(
      children: [
        SizedBox(
          height: 71,
          child: ClipPath(
            clipper: MessageClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                '${_draggedLatLng.latitude.toStringAsFixed(5)},${_draggedLatLng.longitude.toStringAsFixed(5)}',
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _init() async {
    _defaultLatLng = await _goToUserCurrentPosition();
    _cameraPosition = CameraPosition(
        target: LatLng(_defaultLatLng.latitude, _defaultLatLng.longitude));
    _draggedLatLng = _defaultLatLng;
  }

  void updateMarkerPosition() {
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(_draggedLatLng.latitude, _draggedLatLng.longitude)));
  }

  Future<void> _updateMarker() async {
    setState(() {
      markers = {
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: _draggedLatLng,
        ),
      };
    });
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _goToUserCurrentPosition();
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LocationBlocBloc, LocationBlocState>(
        bloc: locationBloc,
        listener: (context, state) {
          if (state is GetLocationPlaceSuccess) {
            _goToPlace(
                lat: state.result.result.geometry.location.lat,
                lng: state.result.result.geometry.location.lng);
          }
        },
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.terrain,
              // markers: markers,
              zoomControlsEnabled: false,
              initialCameraPosition: _cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },

              onCameraMove: (position) {
                _draggedLatLng = position.target;
                _updateMarker();
              },
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height / 2.9,
              left: MediaQuery.sizeOf(context).width / 4,
              child: showLocation(),
            ),
            Positioned(
                top: MediaQuery.sizeOf(context).height / 2.3,
                left: 0,
                right: 0,
                child: customMarker()),
            Positioned(top: 45, left: 18, child: buildBackIcon()),
            Positioned(
                top: 89,
                left: 0,
                right: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
                  child: TextFormField(
                    controller: _searchController,
                    onFieldSubmitted: (value) async {
                      locationBloc.add(
                          GetLocationPlaceEvent(input: _searchController.text));
                    },
                    decoration: InputDecoration(
                      fillColor: AppColors.greyColor,
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            locationBloc.add(GetLocationPlaceEvent(
                                input: _searchController.text));
                          },
                          child: const Icon(Icons.search)),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            14,
                          ),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      hintText: 'Search for your location',
                    ),
                    style: const TextStyle(color: AppColors.blackColor),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                )),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  title: 'Confirm Location',
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 56.h),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const AddItemScreen();
                      },
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToPlace({required double lat, required double lng}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 14)));
  }
}
