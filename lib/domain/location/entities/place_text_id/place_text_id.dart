import 'package:equatable/equatable.dart';
import 'package:machine_test/domain/location/entities/place_id/place_id.dart';

class PlaceTextId extends Equatable {
  final List<PlaceId> candidates;
  final String status;

  const PlaceTextId({required this.candidates, required this.status});

  @override
  List<Object?> get props => [candidates, status];
}
