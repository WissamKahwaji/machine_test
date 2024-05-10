import 'package:dartz/dartz.dart';
import 'package:machine_test/domain/core/entities/failures.dart';
import 'package:machine_test/domain/location/entities/location/location_result.dart';
import 'package:machine_test/domain/location/entities/place_text_id/place_text_id.dart';

abstract class LocationRepository {
  Future<Either<Failure, PlaceTextId>> getPlaceId({
    required String input,
  });

  Future<Either<Failure, LocationResult>> getPlace({
    required String placeId,
  });
}
