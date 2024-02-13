import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/riot/summoner/enum/queue_type.dart';

part 'summoner_entry_model.freezed.dart';
part 'summoner_entry_model.g.dart';

@freezed
class SummonerEntryModel with _$SummonerEntryModel {
  factory SummonerEntryModel({
    required String leagueId,
    required String summonerId,
    required String summonerName,
    required String queueType,
    required String tier,
    required String rank,
    required int leaguePoints,
    required int wins,
    required int losses,
    required bool hotStreak,
    required bool veteran,
    required bool freshBlood,
    required bool inactive,
  }) = _SummonerEntryModel;

  factory SummonerEntryModel.fromJson(Map<String, dynamic> json) => _$SummonerEntryModelFromJson(json);
}

extension SummonerEntryModelExt on SummonerEntryModel {
  QueueType get type => QueueType.values.firstWhere((e) => e.type == queueType);

  int get winPercent => (wins / (wins + losses) * 100).toInt();
}