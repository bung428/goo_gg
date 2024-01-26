// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchInfoModelImpl _$$MatchInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchInfoModelImpl(
      gameId: (json['gameId'] as num).toDouble(),
      queueId: json['queueId'] as int,
      mapId: json['mapId'] as int,
      gameMode: json['gameMode'] as String,
      gameName: json['gameName'] as String,
      gameType: json['gameType'] as String,
      gameVersion: json['gameVersion'] as String,
      tournamentCode: json['tournamentCode'] as String,
      gameDuration: json['gameDuration'] as int,
      gameCreation:
          const EpochDateTimeConverter().fromJson(json['gameCreation'] as int?),
      gameEndTimestamp: const EpochDateTimeConverter()
          .fromJson(json['gameEndTimestamp'] as int?),
      gameStartTimestamp: const EpochDateTimeConverter()
          .fromJson(json['gameStartTimestamp'] as int?),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => TeamRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchInfoModelImplToJson(
        _$MatchInfoModelImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'queueId': instance.queueId,
      'mapId': instance.mapId,
      'gameMode': instance.gameMode,
      'gameName': instance.gameName,
      'gameType': instance.gameType,
      'gameVersion': instance.gameVersion,
      'tournamentCode': instance.tournamentCode,
      'gameDuration': instance.gameDuration,
      'gameCreation':
          const EpochDateTimeConverter().toJson(instance.gameCreation),
      'gameEndTimestamp':
          const EpochDateTimeConverter().toJson(instance.gameEndTimestamp),
      'gameStartTimestamp':
          const EpochDateTimeConverter().toJson(instance.gameStartTimestamp),
      'participants': instance.participants,
      'teams': instance.teams,
    };
