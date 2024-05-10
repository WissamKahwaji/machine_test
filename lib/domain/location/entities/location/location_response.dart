import 'package:equatable/equatable.dart';
import 'package:machine_test/domain/location/entities/location/geometry.dart';

class LocationResponse extends Equatable {
  final Geometry geometry;

  const LocationResponse({required this.geometry});

  @override
  List<Object?> get props => [geometry];
}
