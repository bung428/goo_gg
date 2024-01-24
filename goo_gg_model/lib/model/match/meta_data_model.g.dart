// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaDataModelImpl _$$MetaDataModelImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataModelImpl(
      dataVersion: json['dataVersion'] as String,
      matchId: json['matchId'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$MetaDataModelImplToJson(_$MetaDataModelImpl instance) =>
    <String, dynamic>{
      'dataVersion': instance.dataVersion,
      'matchId': instance.matchId,
      'participants': instance.participants,
    };
