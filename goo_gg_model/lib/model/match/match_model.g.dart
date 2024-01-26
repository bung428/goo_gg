// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchModelImpl _$$MatchModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchModelImpl(
      metadata:
          MetaDataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      info: MatchInfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MatchModelImplToJson(_$MatchModelImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'info': instance.info,
    };
