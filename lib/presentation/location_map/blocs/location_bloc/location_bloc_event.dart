part of 'location_bloc_bloc.dart';

class LocationBlocEvent extends Equatable {
  const LocationBlocEvent();

  @override
  List<Object> get props => [];
}

class GetLocationPlaceEvent extends LocationBlocEvent {
  final String input;

  const GetLocationPlaceEvent({required this.input});
}
