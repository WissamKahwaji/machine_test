import 'package:equatable/equatable.dart';

class LocationLatLng extends Equatable {
  final double lat;
  final double lng;

  const LocationLatLng({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
