import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/data/location/models/location/geometry_model.dart';
import 'package:machine_test/domain/location/entities/location/location_response.dart';

part 'location_response_model.g.dart';

@JsonSerializable()
class LocationResponseModel {
  final GeoMetryModel geometry;

  LocationResponseModel({required this.geometry});

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseModelToJson(this);
}

extension MapToDomain on LocationResponseModel {
  LocationResponse toDomain() =>
      LocationResponse(geometry: geometry.toDomain());
}
