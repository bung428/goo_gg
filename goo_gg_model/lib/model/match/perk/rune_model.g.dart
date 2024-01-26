// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rune_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuneModelImpl _$$RuneModelImplFromJson(Map<String, dynamic> json) =>
    _$RuneModelImpl(
      statPerks:
          StatPerksModel.fromJson(json['statPerks'] as Map<String, dynamic>),
      styles: (json['styles'] as List<dynamic>)
          .map((e) => PerkStyleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RuneModelImplToJson(_$RuneModelImpl instance) =>
    <String, dynamic>{
      'statPerks': instance.statPerks,
      'styles': instance.styles,
    };
