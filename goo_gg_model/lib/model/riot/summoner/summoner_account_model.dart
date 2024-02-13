import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/util/json_converter.dart';
import 'package:intl/intl.dart';

part 'summoner_account_model.freezed.dart';
part 'summoner_account_model.g.dart';

@freezed
class SummonerAccountModel with _$SummonerAccountModel {
  factory SummonerAccountModel({
    required String id,
    required String puuid,
    required String accountId,
    required String name,
    required int profileIconId,
    required double summonerLevel,
    @EpochDateTimeConverter() required DateTime revisionDate,
  }) = _SummonerAccountModel;

  factory SummonerAccountModel.fromJson(Map<String, dynamic> json) => _$SummonerAccountModelFromJson(json);
}

extension SummonerAccountModelExt on SummonerAccountModel {
  String get updateAt => DateFormat('yyyy.MM.dd').format(revisionDate);

  String get profileImg => 'http://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/${profileIconId}.png';
}