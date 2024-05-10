import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/domain/location/entities/location/location_latlng.dart';

part 'location_latlng_model.g.dart';

@JsonSerializable()
class LocationLatLngModel {
  final double lat;
  final double lng;

  LocationLatLngModel({required this.lat, required this.lng});

  factory LocationLatLngModel.fromJson(Map<String, dynamic> json) =>
      _$LocationLatLngModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationLatLngModelToJson(this);
}

extension MapToDomain on LocationLatLngModel {
  LocationLatLng toDomain() => LocationLatLng(lat: lat, lng: lng);
}
