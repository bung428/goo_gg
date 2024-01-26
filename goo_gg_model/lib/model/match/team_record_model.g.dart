// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamRecordModelImpl _$$TeamRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamRecordModelImpl(
      bans: (json['bans'] as List<dynamic>?)
          ?.map((e) => BanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectives: GameObjectRecordModel.fromJson(
          json['objectives'] as Map<String, dynamic>),
      teamId: json['teamId'] as int,
      win: json['win'] as bool,
    );

Map<String, dynamic> _$$TeamRecordModelImplToJson(
        _$TeamRecordModelImpl instance) =>
    <String, dynamic>{
      'bans': instance.bans,
      'objectives': instance.objectives,
      'teamId': instance.teamId,
      'win': instance.win,
    };
