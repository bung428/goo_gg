import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';
import 'package:goo_gg_model/util/timestamp_converter.dart';
import 'package:intl/intl.dart';

class SummonerModel {
  final String name;
  final String tagLine;
  final String id;
  final String puuid;
  final String accountId;
  final DateTime updatedAt;
  final String profileImg;
  final double summonerLevel;

  SummonerModel({
    required this.name,
    required this.tagLine,
    required this.id,
    required this.puuid,
    required this.accountId,
    required this.updatedAt,
    required this.profileImg,
    required this.summonerLevel,
  });

  factory SummonerModel.fromJson(Map<String, dynamic> json) {
    return SummonerModel(
      name: json['name'],
      tagLine: json['tagLine'],
      id: json['id'],
      puuid: json['puuid'],
      accountId: json['accountId'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
      profileImg: json['profileImg'],
      summonerLevel: json['summonerLevel'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'tagLine': tagLine,
    'id': id,
    'puuid': puuid,
    'accountId': accountId,
    'updatedAt': updatedAt.millisecondsSinceEpoch,
    'profileImg': profileImg,
    'summonerLevel': summonerLevel,
  };

  String get tagSharp => '#$tagLine';
  String get summonerLevelStr => '${summonerLevel.toInt()}';
  String get updateAtForm => DateFormat('yyyy.MM.dd').format(updatedAt);
}