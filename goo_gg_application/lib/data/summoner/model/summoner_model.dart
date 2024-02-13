import 'package:goo_gg_model/model/riot/summoner/summoner_entry_model.dart';
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
  final List<SummonerEntryModel>? entries;

  SummonerModel({
    required this.name,
    required this.tagLine,
    required this.id,
    required this.puuid,
    required this.accountId,
    required this.updatedAt,
    required this.profileImg,
    required this.summonerLevel,
    this.entries,
  });

  factory SummonerModel.fromJson(Map<String, dynamic> json) {
    List? list = json['entries'];
    return SummonerModel(
      name: json['name'],
      tagLine: json['tagLine'],
      id: json['id'],
      puuid: json['puuid'],
      accountId: json['accountId'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
      profileImg: json['profileImg'],
      summonerLevel: json['summonerLevel'],
      entries: list?.map((e) => SummonerEntryModel.fromJson(e)).toList()
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
    'entries': entries?.map((e) => e.toJson()).toList()
  };

  String get tagSharp => '#$tagLine';
  String get summonerLevelStr => '${summonerLevel.toInt()}';
  String get updateAtForm => DateFormat('yyyy.MM.dd').format(updatedAt);
}