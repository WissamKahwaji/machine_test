import 'package:equatable/equatable.dart';

class PlaceId extends Equatable {
  final String placeId;

  const PlaceId({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}
