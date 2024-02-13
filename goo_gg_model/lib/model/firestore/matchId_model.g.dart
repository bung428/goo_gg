// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchId_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchIdModelImpl _$$MatchIdModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchIdModelImpl(
      matchIds:
          (json['matchIds'] as List<dynamic>).map((e) => e as String).toList(),
      updatedAt: const RequiredFirestoreTimestampJsonConverter()
          .fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$MatchIdModelImplToJson(_$MatchIdModelImpl instance) =>
    <String, dynamic>{
      'matchIds': instance.matchIds,
      'updatedAt': const RequiredFirestoreTimestampJsonConverter()
          .toJson(instance.updatedAt),
    };
