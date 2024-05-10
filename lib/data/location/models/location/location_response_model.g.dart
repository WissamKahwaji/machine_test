// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponseModel _$LocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocationResponseModel(
      geometry:
          GeoMetryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationResponseModelToJson(
        LocationResponseModel instance) =>
    <String, dynamic>{
      'geometry': instance.geometry,
    };
