import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/domain/location/entities/location/location_result.dart';
import 'package:machine_test/domain/location/entities/place_text_id/place_text_id.dart';
import 'package:machine_test/domain/location/usecases/get_place_id_use_case.dart';
import 'package:machine_test/domain/location/usecases/get_place_use_case.dart';
part 'location_bloc_event.dart';
part 'location_bloc_state.dart';

@injectable
class LocationBlocBloc extends Bloc<LocationBlocEvent, LocationBlocState> {
  final GetPlaceIdUseCase getPlaceIdUseCase;
  final GetPlaceUseCase getPlaceUseCase;
  LocationBlocBloc({
    required this.getPlaceIdUseCase,
    required this.getPlaceUseCase,
  }) : super(LocationBlocInitial()) {
    on<GetLocationPlaceEvent>((event, emit) async {
      final placeIdResult =
          await getPlaceIdUseCase(GetPlaceIdParams(input: event.input));
      late PlaceTextId placeId;
      placeIdResult.fold((l) => null, (r) => placeId = r);

      final result = await getPlaceUseCase(
          GetPlaceParams(placeId: placeId.candidates[0].placeId));

      emit(result.fold((l) => GetLocationPlaceFailure(),
          (r) => GetLocationPlaceSuccess(result: r)));
    });
  }
}
