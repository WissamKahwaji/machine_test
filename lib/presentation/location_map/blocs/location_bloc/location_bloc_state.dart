part of 'location_bloc_bloc.dart';

class LocationBlocState extends Equatable {
  const LocationBlocState();

  @override
  List<Object> get props => [];
}

final class LocationBlocInitial extends LocationBlocState {}

class GetLocationPlaceInProgress extends LocationBlocState {}

class GetLocationPlaceFailure extends LocationBlocState {}

class GetLocationPlaceSuccess extends LocationBlocState {
  final LocationResult result;

  const GetLocationPlaceSuccess({required this.result});
}
