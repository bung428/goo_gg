import 'dart:ui' as ui;

class GameAnalysisModel {
  final ui.Image? champIconData;
  final int totalDamage;
  final int totalDamageTaken;
  final int damageToChampion;
  final int gold;
  final int turret;
  final int visionScore;
  final int bountyLevel;

  GameAnalysisModel({
    required this.champIconData,
    required this.totalDamage,
    required this.totalDamageTaken,
    required this.damageToChampion,
    required this.gold,
    required this.turret,
    required this.visionScore,
    required this.bountyLevel
  });
}