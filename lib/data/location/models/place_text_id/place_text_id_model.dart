import 'package:json_annotation/json_annotation.dart';
import 'package:machine_test/data/location/models/place_id/place_id_model.dart';
import 'package:machine_test/domain/location/entities/place_text_id/place_text_id.dart';

part 'place_text_id_model.g.dart';

@JsonSerializable()
class PlaceTextIdModel {
  final List<PlaceIdModel> candidates;
  final String status;

  PlaceTextIdModel({required this.candidates, required this.status});
  factory PlaceTextIdModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceTextIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceTextIdModelToJson(this);
}

extension MapToDomain on PlaceTextIdModel {
  PlaceTextId toDomain() => PlaceTextId(
        candidates: candidates.map((e) => e.toDomain()).toList(),
        status: status,
      );
}
