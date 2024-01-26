// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perk_style_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerkStyleModelImpl _$$PerkStyleModelImplFromJson(Map<String, dynamic> json) =>
    _$PerkStyleModelImpl(
      description: json['description'] as String,
      style: json['style'] as int,
      selections: (json['selections'] as List<dynamic>)
          .map((e) => PerkInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PerkStyleModelImplToJson(
        _$PerkStyleModelImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'style': instance.style,
      'selections': instance.selections,
    };
