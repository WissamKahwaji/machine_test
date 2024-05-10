// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_text_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceTextIdModel _$PlaceTextIdModelFromJson(Map<String, dynamic> json) =>
    PlaceTextIdModel(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => PlaceIdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$PlaceTextIdModelToJson(PlaceTextIdModel instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'status': instance.status,
    };
