import 'package:goo_gg_model/model/summoner/account_model.dart';
import 'package:goo_gg_model/model/summoner/summoner_account_model.dart';
import 'package:intl/intl.dart';

class SummonerModel {
  final String name;
  final String tag;
  final String id;
  final String puuid;
  final String accountId;
  final DateTime revisionDate;
  final String profileImg;
  final double level;

  SummonerModel({
    required this.name,
    required this.tag,
    required this.id,
    required this.puuid,
    required this.accountId,
    required this.revisionDate,
    required this.profileImg,
    required this.level
  });

  factory SummonerModel.fromModel(
    SummonerAccountModel model,
    AccountModel accountModel
  ) => SummonerModel(
    name: model.name,
    tag: accountModel.tagLine,
    id: model.id,
    puuid: model.puuid,
    accountId: model.accountId,
    revisionDate: model.revisionDate,
    profileImg: model.profileImg,
    level: model.summonerLevel
  );

  factory SummonerModel.fromJson(Map<String, dynamic> json) => SummonerModel(
    name: json['name'],
    tag: json['tag'],
    id: json['id'],
    puuid: json['puuid'],
    accountId: json['accountId'],
    revisionDate: DateTime.parse(json['revisionDate']),
    profileImg: json['profileImg'],
    level: json['level']
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'tag': tag,
    'id': id,
    'puuid': puuid,
    'accountId': accountId,
    'revisionDate': revisionDate.toString(),
    'profileImg': profileImg,
    'level': level,
  };

  String get levelStr => '${level.toInt()}';
  String get updateAt => DateFormat('yyyy.MM.dd').format(revisionDate);
}