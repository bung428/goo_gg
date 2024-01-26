// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_object_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameObjectRecordModelImpl _$$GameObjectRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GameObjectRecordModelImpl(
      baron: GameObjectModel.fromJson(json['baron'] as Map<String, dynamic>),
      champion:
          GameObjectModel.fromJson(json['champion'] as Map<String, dynamic>),
      dragon: GameObjectModel.fromJson(json['dragon'] as Map<String, dynamic>),
      horde: GameObjectModel.fromJson(json['horde'] as Map<String, dynamic>),
      inhibitor:
          GameObjectModel.fromJson(json['inhibitor'] as Map<String, dynamic>),
      riftHerald:
          GameObjectModel.fromJson(json['riftHerald'] as Map<String, dynamic>),
      tower: GameObjectModel.fromJson(json['tower'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameObjectRecordModelImplToJson(
        _$GameObjectRecordModelImpl instance) =>
    <String, dynamic>{
      'baron': instance.baron,
      'champion': instance.champion,
      'dragon': instance.dragon,
      'horde': instance.horde,
      'inhibitor': instance.inhibitor,
      'riftHerald': instance.riftHerald,
      'tower': instance.tower,
    };
