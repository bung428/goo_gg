// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class GameDetailInfoModel {
  final List<PlayerInfoModel>? redTeamInfo;
  final List<PlayerInfoModel>? blueTeamInfo;
  final List<TeamObjectInfoModel>? teamObjectInfo;

  GameDetailInfoModel({
    required this.redTeamInfo,
    required this.blueTeamInfo,
    required this.teamObjectInfo,
  });

  bool get isWinBlue =>
      teamObjectInfo?.firstWhereOrNull((e) => e.isBlue && (e.win ?? false)) == null
          ? false
          : true;

  Color get bgColor => isWinBlue
      ? Colors.blueAccent.withOpacity(0.4)
      : Colors.redAccent.withOpacity(0.4);
}

class TeamObjectInfoModel {
  final bool isBlue;
  final bool? win;
  final int teamGolds;
  final int teamKills;
  final int teamDeaths;
  final int teamAssists;
  final int baron;
  final int dragon;
  final int horde; /// 유충
  final int inhibitor; /// 억제기
  final int riftHerald; /// 전령
  final int tower;

  TeamObjectInfoModel({
    required this.isBlue,
    required this.win,
    required this.teamGolds,
    required this.teamKills,
    required this.teamDeaths,
    required this.teamAssists,
    required this.baron,
    required this.dragon,
    required this.horde,
    required this.inhibitor,
    required this.riftHerald,
    required this.tower,
  });
}

class PlayerInfoModel {
  final String nickName;
  final String championUrl;
  final String kda;
  final String grade;
  final int gold;
  final int totalCs;
  final int championLevel;
  final bool isBlue;
  final bool win;
  final double killInvolvement;
  final double totalCsPerMin;
  final List<String> spells;
  final List<String> runes;
  final List<String> items;

  PlayerInfoModel({
    required this.nickName,
    required this.championUrl,
    required this.championLevel,
    required this.spells,
    required this.runes,
    required this.kda,
    required this.grade,
    required this.killInvolvement,
    required this.items,
    required this.totalCs,
    required this.gold,
    this.win = false,
    this.isBlue = false,
    required this.totalCsPerMin,
  });

  String get killInvolvementStr => '${((killInvolvement ?? 0) * 100).floor()}%';
}