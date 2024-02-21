import 'package:goo_gg_model/model/riot/match/object_count_model.dart';
import 'package:goo_gg_model/model/riot/match/ping_count_model.dart';

class GameAnalysisModel {
  // final ui.Image? champIconData;
  // final Uint8List? champImage;
  final List<PingCountModel> pings;
  final List<ObjectCountModel> objects;
  final String url;
  final String kda;
  final bool isBlue;
  final bool win;
  final int totalDamage;
  final int totalDamageTaken;
  final int damageToChampion;
  final int gold;
  final int turret;
  final int visionScore;
  final int bountyLevel;

  GameAnalysisModel({
    // required this.champIconData,
    // required this.champImage,
    required this.url,
    required this.totalDamage,
    required this.totalDamageTaken,
    required this.damageToChampion,
    required this.gold,
    required this.pings,
    required this.objects,
    required this.kda,
    required this.win,
    required this.isBlue,
    required this.turret,
    required this.visionScore,
    required this.bountyLevel
  });

  Map<String, dynamic> toJson() => {
    'url': url,
    'totalDamage': totalDamage,
    'totalDamageTaken': totalDamageTaken,
    'damageToChampion': damageToChampion,
    'gold': gold,
    'pings': pings,
    'objects': objects,
    'kda': kda,
    'win': win,
    'isBlue': isBlue,
    'turret': turret,
    'visionScore': visionScore,
    'bountyLevel': bountyLevel,
  };
}