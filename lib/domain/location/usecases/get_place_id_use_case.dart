import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/domain/core/entities/failures.dart';
import 'package:machine_test/domain/core/usecases/use_case.dart';
import 'package:machine_test/domain/location/entities/place_text_id/place_text_id.dart';
import 'package:machine_test/domain/location/repositories/location_repositories.dart';

@LazySingleton()
class GetPlaceIdUseCase extends UseCase<PlaceTextId, GetPlaceIdParams> {
  final LocationRepository locationRepository;

  GetPlaceIdUseCase({required this.locationRepository});
  @override
  Future<Either<Failure, PlaceTextId>> call(GetPlaceIdParams params) {
    return locationRepository.getPlaceId(input: params.input);
  }
}

class GetPlaceIdParams {
  final String input;

  GetPlaceIdParams({required this.input});
}
