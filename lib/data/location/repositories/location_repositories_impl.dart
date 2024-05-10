import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/data/location/datasources/location_remote_data_source.dart';
import 'package:machine_test/data/location/models/location/location_result_model.dart';
import 'package:machine_test/data/location/models/place_text_id/place_text_id_model.dart';
import 'package:machine_test/domain/core/entities/failures.dart';
import 'package:machine_test/domain/core/utils/network/network_info.dart';
import 'package:machine_test/domain/location/entities/location/location_result.dart';
import 'package:machine_test/domain/location/entities/place_text_id/place_text_id.dart';
import 'package:machine_test/domain/location/repositories/location_repositories.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final NetworkInfo networkInfo;
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl(
      {required this.networkInfo, required this.locationRemoteDataSource});
  @override
  Future<Either<Failure, PlaceTextId>> getPlaceId(
      {required String input}) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await locationRemoteDataSource.getPlaceId(input);

        return Right(result.toDomain());
      } else {
        return Left(OfflineFailure());
      }
    } catch (e) {
      return Left(ServerFailure(message: 'server error : $e'));
    }
  }

  @override
  Future<Either<Failure, LocationResult>> getPlace(
      {required String placeId}) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await locationRemoteDataSource.getPlace(placeId);

        return Right(result.toDomain());
      } else {
        return Left(OfflineFailure());
      }
    } catch (e) {
      return Left(ServerFailure(message: 'server error : $e'));
    }
  }
}
