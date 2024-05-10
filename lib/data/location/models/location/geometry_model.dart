import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/data/location/models/location/location_latlng_model.dart';
import 'package:machine_test/domain/location/entities/location/geometry.dart';

part 'geometry_model.g.dart';

@JsonSerializable()
class GeoMetryModel {
  final LocationLatLngModel location;

  GeoMetryModel({required this.location});

  factory GeoMetryModel.fromJson(Map<String, dynamic> json) =>
      _$GeoMetryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoMetryModelToJson(this);
}

extension MapToDomain on GeoMetryModel {
  Geometry toDomain() => Geometry(location: location.toDomain());
}
