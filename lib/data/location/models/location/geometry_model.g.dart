// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoMetryModel _$GeoMetryModelFromJson(Map<String, dynamic> json) =>
    GeoMetryModel(
      location: LocationLatLngModel.fromJson(
          json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeoMetryModelToJson(GeoMetryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
    };
