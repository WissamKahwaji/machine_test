// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResultModel _$LocationResultModelFromJson(Map<String, dynamic> json) =>
    LocationResultModel(
      result: LocationResponseModel.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationResultModelToJson(
        LocationResultModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
