import 'package:equatable/equatable.dart';
import 'package:machine_test/domain/location/entities/location/location_response.dart';

class LocationResult extends Equatable {
  final LocationResponse result;

  const LocationResult({required this.result});

  @override
  List<Object?> get props => [result];
}
