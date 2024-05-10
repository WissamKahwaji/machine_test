import 'package:equatable/equatable.dart';
import 'package:machine_test/domain/location/entities/location/location_latlng.dart';

class Geometry extends Equatable {
  final LocationLatLng location;

  const Geometry({required this.location});

  @override
  List<Object?> get props => [location];
}
