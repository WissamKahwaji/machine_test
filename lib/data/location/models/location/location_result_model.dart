import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/data/location/models/location/location_response_model.dart';
import 'package:machine_test/domain/location/entities/location/location_result.dart';

part 'location_result_model.g.dart';

@JsonSerializable()
class LocationResultModel {
  final LocationResponseModel result;

  LocationResultModel({required this.result});

  factory LocationResultModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResultModelToJson(this);
}

extension MapToDomain on LocationResultModel {
  LocationResult toDomain() => LocationResult(result: result.toDomain());
}
