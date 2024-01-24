// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchModelImpl _$$MatchModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchModelImpl(
      metaData: json['metaData'] == null
          ? null
          : MetaDataModel.fromJson(json['metaData'] as Map<String, dynamic>),
      info: json['info'] == null
          ? null
          : MatchInfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MatchModelImplToJson(_$MatchModelImpl instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'info': instance.info,
    };
