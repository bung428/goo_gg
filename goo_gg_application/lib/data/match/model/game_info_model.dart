import 'package:flutter/material.dart';
import 'package:goo_gg_application/data/match/enum/game_result.dart';
import 'package:goo_gg_model/model/riot/match/enum/game_type.dart';
import 'package:relative_time/relative_time.dart';

class GameInfoModel {
  final GameType gameType;
  final DateTime? finishedAt;
  final GameResult? gameResult;
  final String gameDuration;
  final String? gameMode;

  GameInfoModel({
    required this.gameType,
    required this.finishedAt,
    required this.gameResult,
    required this.gameDuration,
    required this.gameMode
  });

  Map<String, dynamic> toJson() => {
    'gameType' : gameType,
    'finishedAt' : finishedAt,
    'gameResult' : gameResult,
    'gameDuration' : gameDuration,
    'gameMode' : gameMode,
  };
  
  String? get finishedAtStr => finishedAt == null
      ? null : RelativeTime.locale(const Locale('ko')).format(finishedAt!);
}