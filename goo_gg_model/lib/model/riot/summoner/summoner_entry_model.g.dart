// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummonerEntryModelImpl _$$SummonerEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SummonerEntryModelImpl(
      leagueId: json['leagueId'] as String,
      summonerId: json['summonerId'] as String,
      summonerName: json['summonerName'] as String,
      queueType: json['queueType'] as String,
      tier: json['tier'] as String,
      rank: json['rank'] as String,
      leaguePoints: json['leaguePoints'] as int,
      wins: json['wins'] as int,
      losses: json['losses'] as int,
      hotStreak: json['hotStreak'] as bool,
      veteran: json['veteran'] as bool,
      freshBlood: json['freshBlood'] as bool,
      inactive: json['inactive'] as bool,
    );

Map<String, dynamic> _$$SummonerEntryModelImplToJson(
        _$SummonerEntryModelImpl instance) =>
    <String, dynamic>{
      'leagueId': instance.leagueId,
      'summonerId': instance.summonerId,
      'summonerName': instance.summonerName,
      'queueType': instance.queueType,
      'tier': instance.tier,
      'rank': instance.rank,
      'leaguePoints': instance.leaguePoints,
      'wins': instance.wins,
      'losses': instance.losses,
      'hotStreak': instance.hotStreak,
      'veteran': instance.veteran,
      'freshBlood': instance.freshBlood,
      'inactive': instance.inactive,
    };
