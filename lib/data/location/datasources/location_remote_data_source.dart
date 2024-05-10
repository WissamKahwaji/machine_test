import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/data/core/utils/network/configuration.dart';
import 'package:machine_test/data/location/models/location/location_result_model.dart';
import 'package:machine_test/data/location/models/place_text_id/place_text_id_model.dart';
import 'package:retrofit/http.dart';

part 'location_remote_data_source.g.dart';

abstract class LocationRemoteDataSource {
  Future<PlaceTextIdModel> getPlaceId(String input);

  Future<LocationResultModel> getPlace(String placeId);
}

@LazySingleton(as: LocationRemoteDataSource)
@RestApi(baseUrl: '')
abstract class LocationRemoteDataSourceImpl extends LocationRemoteDataSource {
  @factoryMethod
  factory LocationRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _LocationRemoteDataSourceImpl(dio,
        baseUrl: configuration.getBaseUrl);
  }

  @override
  @GET(
      '/findplacefromtext/json?inputtype=textquery&key=AIzaSyC-cpDKvIJcxdjJPJ3FUKvUvd4vFO9o3v0')
  Future<PlaceTextIdModel> getPlaceId(@Query('input') String input);

  @override
  @GET('/details/json?key=AIzaSyC-cpDKvIJcxdjJPJ3FUKvUvd4vFO9o3v0')
  Future<LocationResultModel> getPlace(
    @Query('place_id') String placeId,
  );
}
