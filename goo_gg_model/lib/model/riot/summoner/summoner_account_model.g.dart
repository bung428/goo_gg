// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummonerAccountModelImpl _$$SummonerAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SummonerAccountModelImpl(
      id: json['id'] as String,
      puuid: json['puuid'] as String,
      accountId: json['accountId'] as String,
      name: json['name'] as String,
      profileIconId: json['profileIconId'] as int,
      summonerLevel: (json['summonerLevel'] as num).toDouble(),
      revisionDate:
          const EpochDateTimeConverter().fromJson(json['revisionDate'] as int?),
    );

Map<String, dynamic> _$$SummonerAccountModelImplToJson(
        _$SummonerAccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'puuid': instance.puuid,
      'accountId': instance.accountId,
      'name': instance.name,
      'profileIconId': instance.profileIconId,
      'summonerLevel': instance.summonerLevel,
      'revisionDate':
          const EpochDateTimeConverter().toJson(instance.revisionDate),
    };
