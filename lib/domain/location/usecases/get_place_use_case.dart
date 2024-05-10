import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/domain/core/entities/failures.dart';
import 'package:machine_test/domain/core/usecases/use_case.dart';
import 'package:machine_test/domain/location/entities/location/location_result.dart';

import '../repositories/location_repositories.dart';

@LazySingleton()
class GetPlaceUseCase extends UseCase<LocationResult, GetPlaceParams> {
  final LocationRepository locationRepository;

  GetPlaceUseCase({required this.locationRepository});

  @override
  Future<Either<Failure, LocationResult>> call(GetPlaceParams params) {
    return locationRepository.getPlace(placeId: params.placeId);
  }
}

class GetPlaceParams {
  final String placeId;

  GetPlaceParams({required this.placeId});
}
