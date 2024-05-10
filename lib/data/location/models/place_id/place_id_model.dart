import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/domain/location/entities/place_id/place_id.dart';

part 'place_id_model.g.dart';

@JsonSerializable()
class PlaceIdModel {
  @JsonKey(name: 'place_id')
  final String placeId;

  PlaceIdModel({required this.placeId});
  factory PlaceIdModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceIdModelToJson(this);
}

extension MapToDomain on PlaceIdModel {
  PlaceId toDomain() => PlaceId(placeId: placeId);
}
