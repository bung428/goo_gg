// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:goo_gg_model/model/riot/match/enum/ping_type.dart';
import 'package:goo_gg_model/model/riot/match/enum/rune_type.dart';
import 'package:goo_gg_model/model/riot/match/enum/spell_type.dart';
import 'package:goo_gg_model/model/riot/match/perk/rune_model.dart';
import 'package:goo_gg_model/model/riot/match/ping_count_model.dart';

import 'mission_model.dart';

class ParticipantModel {
  int? allInPings;
  int? assistMePings;
  int? assists;
  int? baronKills;
  int? basicPings;
  int? bountyLevel;
  int? champExperience;
  int? champLevel;
  int? championId;
  String? championName;
  int? championTransform;
  int? commandPings;
  int? consumablesPurchased;
  int? damageDealtToBuildings;
  int? damageDealtToObjectives;
  int? damageDealtToTurrets;
  int? damageSelfMitigated;
  int? dangerPings;
  int? deaths;
  int? detectorWardsPlaced;
  int? doubleKills;
  int? dragonKills;
  bool? eligibleForProgression;
  int? enemyMissingPings;
  int? enemyVisionPings;
  bool? firstBloodAssist;
  bool? firstBloodKill;
  bool? firstTowerAssist;
  bool? firstTowerKill;
  bool? gameEndedInEarlySurrender;
  bool? gameEndedInSurrender;
  int? getBackPings;
  int? goldEarned;
  int? goldSpent;
  int? holdPings;
  String? individualPosition;
  int? inhibitorKills;
  int? inhibitorTakedowns;
  int? inhibitorsLost;
  int? item0;
  int? item1;
  int? item2;
  int? item3;
  int? item4;
  int? item5;
  int? item6;
  int? itemsPurchased;
  int? killingSprees;
  int? kills;
  String? lane;
  int? largestCriticalStrike;
  int? largestKillingSpree;
  int? largestMultiKill;
  int? longestTimeSpentLiving;
  int? magicDamageDealt;
  int? magicDamageDealtToChampions;
  int? magicDamageTaken;
  MissionModel? missions;
  int? needVisionPings;
  int? neutralMinionsKilled;
  int? nexusKills;
  int? nexusLost;
  int? nexusTakedowns;
  int? objectivesStolen;
  int? objectivesStolenAssists;
  int? onMyWayPings;
  int? participantId;
  int? pentaKills;
  RuneModel? perks;
  int? physicalDamageDealt;
  int? physicalDamageDealtToChampions;
  int? physicalDamageTaken;
  int? placement;
  int? playerAugment1;
  int? playerAugment2;
  int? playerAugment3;
  int? playerAugment4;
  int? playerScore0;
  int? playerScore1;
  int? playerScore10;
  int? playerScore11;
  int? playerScore2;
  int? playerScore3;
  int? playerScore4;
  int? playerScore5;
  int? playerScore6;
  int? playerScore7;
  int? playerScore8;
  int? playerScore9;
  int? playerSubteamId;
  int? profileIcon;
  int? pushPings;
  String? puuid;
  int? quadraKills;
  String? riotIdGameName;
  String? riotIdTagline;
  String? role;
  int? sightWardsBoughtInGame;
  int? spell1Casts;
  int? spell2Casts;
  int? spell3Casts;
  int? spell4Casts;
  int? subteamPlacement;
  int? summoner1Casts;
  int? summoner1Id;
  int? summoner2Casts;
  int? summoner2Id;
  String? summonerId;
  int? summonerLevel;
  String? summonerName;
  bool? teamEarlySurrendered;
  int? teamId;
  String? teamPosition;
  int? timeCCingOthers;
  int? timePlayed;
  int? totalAllyJungleMinionsKilled;
  int? totalDamageDealt;
  int? totalDamageDealtToChampions;
  int? totalDamageShieldedOnTeammates;
  int? totalDamageTaken;
  int? totalEnemyJungleMinionsKilled;
  int? totalHeal;
  int? totalHealsOnTeammates;
  int? totalMinionsKilled;
  int? totalTimeCCDealt;
  int? totalTimeSpentDead;
  int? totalUnitsHealed;
  int? tripleKills;
  int? trueDamageDealt;
  int? trueDamageDealtToChampions;
  int? trueDamageTaken;
  int? turretKills;
  int? turretTakedowns;
  int? turretsLost;
  int? unrealKills;
  int? visionClearedPings;
  int? visionScore;
  int? visionWardsBoughtInGame;
  int? wardsKilled;
  int? wardsPlaced;
  bool? win;

  ParticipantModel(
      {this.allInPings,
        this.assistMePings,
        this.assists,
        this.baronKills,
        this.basicPings,
        this.bountyLevel,
        this.champExperience,
        this.champLevel,
        this.championId,
        this.championName,
        this.championTransform,
        this.commandPings,
        this.consumablesPurchased,
        this.damageDealtToBuildings,
        this.damageDealtToObjectives,
        this.damageDealtToTurrets,
        this.damageSelfMitigated,
        this.dangerPings,
        this.deaths,
        this.detectorWardsPlaced,
        this.doubleKills,
        this.dragonKills,
        this.eligibleForProgression,
        this.enemyMissingPings,
        this.enemyVisionPings,
        this.firstBloodAssist,
        this.firstBloodKill,
        this.firstTowerAssist,
        this.firstTowerKill,
        this.gameEndedInEarlySurrender,
        this.gameEndedInSurrender,
        this.getBackPings,
        this.goldEarned,
        this.goldSpent,
        this.holdPings,
        this.individualPosition,
        this.inhibitorKills,
        this.inhibitorTakedowns,
        this.inhibitorsLost,
        this.item0,
        this.item1,
        this.item2,
        this.item3,
        this.item4,
        this.item5,
        this.item6,
        this.itemsPurchased,
        this.killingSprees,
        this.kills,
        this.lane,
        this.largestCriticalStrike,
        this.largestKillingSpree,
        this.largestMultiKill,
        this.longestTimeSpentLiving,
        this.magicDamageDealt,
        this.magicDamageDealtToChampions,
        this.magicDamageTaken,
        this.missions,
        this.needVisionPings,
        this.neutralMinionsKilled,
        this.nexusKills,
        this.nexusLost,
        this.nexusTakedowns,
        this.objectivesStolen,
        this.objectivesStolenAssists,
        this.onMyWayPings,
        this.participantId,
        this.pentaKills,
        this.perks,
        this.physicalDamageDealt,
        this.physicalDamageDealtToChampions,
        this.physicalDamageTaken,
        this.placement,
        this.playerAugment1,
        this.playerAugment2,
        this.playerAugment3,
        this.playerAugment4,
        this.playerScore0,
        this.playerScore1,
        this.playerScore10,
        this.playerScore11,
        this.playerScore2,
        this.playerScore3,
        this.playerScore4,
        this.playerScore5,
        this.playerScore6,
        this.playerScore7,
        this.playerScore8,
        this.playerScore9,
        this.playerSubteamId,
        this.profileIcon,
        this.pushPings,
        this.puuid,
        this.quadraKills,
        this.riotIdGameName,
        this.riotIdTagline,
        this.role,
        this.sightWardsBoughtInGame,
        this.spell1Casts,
        this.spell2Casts,
        this.spell3Casts,
        this.spell4Casts,
        this.subteamPlacement,
        this.summoner1Casts,
        this.summoner1Id,
        this.summoner2Casts,
        this.summoner2Id,
        this.summonerId,
        this.summonerLevel,
        this.summonerName,
        this.teamEarlySurrendered,
        this.teamId,
        this.teamPosition,
        this.timeCCingOthers,
        this.timePlayed,
        this.totalAllyJungleMinionsKilled,
        this.totalDamageDealt,
        this.totalDamageDealtToChampions,
        this.totalDamageShieldedOnTeammates,
        this.totalDamageTaken,
        this.totalEnemyJungleMinionsKilled,
        this.totalHeal,
        this.totalHealsOnTeammates,
        this.totalMinionsKilled,
        this.totalTimeCCDealt,
        this.totalTimeSpentDead,
        this.totalUnitsHealed,
        this.tripleKills,
        this.trueDamageDealt,
        this.trueDamageDealtToChampions,
        this.trueDamageTaken,
        this.turretKills,
        this.turretTakedowns,
        this.turretsLost,
        this.unrealKills,
        this.visionClearedPings,
        this.visionScore,
        this.visionWardsBoughtInGame,
        this.wardsKilled,
        this.wardsPlaced,
        this.win
      });

  List<PingCountModel> get pings => [
    PingCountModel(type: PingType.back, count: getBackPings ?? 0),
    PingCountModel(type: PingType.danger, count: dangerPings ?? 0),
    PingCountModel(type: PingType.push, count: pushPings ?? 0),
    PingCountModel(type: PingType.onMyWay, count: onMyWayPings ?? 0),
    PingCountModel(type: PingType.allIn, count: allInPings ?? 0),
    PingCountModel(type: PingType.assistMe, count: assistMePings ?? 0),
    PingCountModel(type: PingType.needVision, count: needVisionPings ?? 0),
    PingCountModel(type: PingType.enemyMissing, count: enemyMissingPings ?? 0),
    PingCountModel(type: PingType.enemyVision, count: enemyVisionPings ?? 0),
  ];

  ParticipantModel.fromJson(Map<String, dynamic> json) {
    allInPings = json['allInPings'];
    assistMePings = json['assistMePings'];
    assists = json['assists'];
    baronKills = json['baronKills'];
    basicPings = json['basicPings'];
    bountyLevel = json['bountyLevel'];
    champExperience = json['champExperience'];
    champLevel = json['champLevel'];
    championId = json['championId'];
    championName = json['championName'];
    championTransform = json['championTransform'];
    commandPings = json['commandPings'];
    consumablesPurchased = json['consumablesPurchased'];
    damageDealtToBuildings = json['damageDealtToBuildings'];
    damageDealtToObjectives = json['damageDealtToObjectives'];
    damageDealtToTurrets = json['damageDealtToTurrets'];
    damageSelfMitigated = json['damageSelfMitigated'];
    dangerPings = json['dangerPings'];
    deaths = json['deaths'];
    detectorWardsPlaced = json['detectorWardsPlaced'];
    doubleKills = json['doubleKills'];
    dragonKills = json['dragonKills'];
    eligibleForProgression = json['eligibleForProgression'];
    enemyMissingPings = json['enemyMissingPings'];
    enemyVisionPings = json['enemyVisionPings'];
    firstBloodAssist = json['firstBloodAssist'];
    firstBloodKill = json['firstBloodKill'];
    firstTowerAssist = json['firstTowerAssist'];
    firstTowerKill = json['firstTowerKill'];
    gameEndedInEarlySurrender = json['gameEndedInEarlySurrender'];
    gameEndedInSurrender = json['gameEndedInSurrender'];
    getBackPings = json['getBackPings'];
    goldEarned = json['goldEarned'];
    goldSpent = json['goldSpent'];
    holdPings = json['holdPings'];
    individualPosition = json['individualPosition'];
    inhibitorKills = json['inhibitorKills'];
    inhibitorTakedowns = json['inhibitorTakedowns'];
    inhibitorsLost = json['inhibitorsLost'];
    item0 = json['item0'];
    item1 = json['item1'];
    item2 = json['item2'];
    item3 = json['item3'];
    item4 = json['item4'];
    item5 = json['item5'];
    item6 = json['item6'];
    itemsPurchased = json['itemsPurchased'];
    killingSprees = json['killingSprees'];
    kills = json['kills'];
    lane = json['lane'];
    largestCriticalStrike = json['largestCriticalStrike'];
    largestKillingSpree = json['largestKillingSpree'];
    largestMultiKill = json['largestMultiKill'];
    longestTimeSpentLiving = json['longestTimeSpentLiving'];
    magicDamageDealt = json['magicDamageDealt'];
    magicDamageDealtToChampions = json['magicDamageDealtToChampions'];
    magicDamageTaken = json['magicDamageTaken'];
    missions = json['missions'] != null
        ? new MissionModel.fromJson(json['missions'])
        : null;
    needVisionPings = json['needVisionPings'];
    neutralMinionsKilled = json['neutralMinionsKilled'];
    nexusKills = json['nexusKills'];
    nexusLost = json['nexusLost'];
    nexusTakedowns = json['nexusTakedowns'];
    objectivesStolen = json['objectivesStolen'];
    objectivesStolenAssists = json['objectivesStolenAssists'];
    onMyWayPings = json['onMyWayPings'];
    participantId = json['participantId'];
    pentaKills = json['pentaKills'];
    perks = json['perks'] != null ? new RuneModel.fromJson(json['perks']) : null;
    physicalDamageDealt = json['physicalDamageDealt'];
    physicalDamageDealtToChampions = json['physicalDamageDealtToChampions'];
    physicalDamageTaken = json['physicalDamageTaken'];
    placement = json['placement'];
    playerAugment1 = json['playerAugment1'];
    playerAugment2 = json['playerAugment2'];
    playerAugment3 = json['playerAugment3'];
    playerAugment4 = json['playerAugment4'];
    playerScore0 = json['playerScore0'];
    playerScore1 = json['playerScore1'];
    playerScore10 = json['playerScore10'];
    playerScore11 = json['playerScore11'];
    playerScore2 = json['playerScore2'];
    playerScore3 = json['playerScore3'];
    playerScore4 = json['playerScore4'];
    playerScore5 = json['playerScore5'];
    playerScore6 = json['playerScore6'];
    playerScore7 = json['playerScore7'];
    playerScore8 = json['playerScore8'];
    playerScore9 = json['playerScore9'];
    playerSubteamId = json['playerSubteamId'];
    profileIcon = json['profileIcon'];
    pushPings = json['pushPings'];
    puuid = json['puuid'];
    quadraKills = json['quadraKills'];
    riotIdGameName = json['riotIdGameName'];
    riotIdTagline = json['riotIdTagline'];
    role = json['role'];
    sightWardsBoughtInGame = json['sightWardsBoughtInGame'];
    spell1Casts = json['spell1Casts'];
    spell2Casts = json['spell2Casts'];
    spell3Casts = json['spell3Casts'];
    spell4Casts = json['spell4Casts'];
    subteamPlacement = json['subteamPlacement'];
    summoner1Casts = json['summoner1Casts'];
    summoner1Id = json['summoner1Id'];
    summoner2Casts = json['summoner2Casts'];
    summoner2Id = json['summoner2Id'];
    summonerId = json['summonerId'];
    summonerLevel = json['summonerLevel'];
    summonerName = json['summonerName'];
    teamEarlySurrendered = json['teamEarlySurrendered'];
    teamId = json['teamId'];
    teamPosition = json['teamPosition'];
    timeCCingOthers = json['timeCCingOthers'];
    timePlayed = json['timePlayed'];
    totalAllyJungleMinionsKilled = json['totalAllyJungleMinionsKilled'];
    totalDamageDealt = json['totalDamageDealt'];
    totalDamageDealtToChampions = json['totalDamageDealtToChampions'];
    totalDamageShieldedOnTeammates = json['totalDamageShieldedOnTeammates'];
    totalDamageTaken = json['totalDamageTaken'];
    totalEnemyJungleMinionsKilled = json['totalEnemyJungleMinionsKilled'];
    totalHeal = json['totalHeal'];
    totalHealsOnTeammates = json['totalHealsOnTeammates'];
    totalMinionsKilled = json['totalMinionsKilled'];
    totalTimeCCDealt = json['totalTimeCCDealt'];
    totalTimeSpentDead = json['totalTimeSpentDead'];
    totalUnitsHealed = json['totalUnitsHealed'];
    tripleKills = json['tripleKills'];
    trueDamageDealt = json['trueDamageDealt'];
    trueDamageDealtToChampions = json['trueDamageDealtToChampions'];
    trueDamageTaken = json['trueDamageTaken'];
    turretKills = json['turretKills'];
    turretTakedowns = json['turretTakedowns'];
    turretsLost = json['turretsLost'];
    unrealKills = json['unrealKills'];
    visionClearedPings = json['visionClearedPings'];
    visionScore = json['visionScore'];
    visionWardsBoughtInGame = json['visionWardsBoughtInGame'];
    wardsKilled = json['wardsKilled'];
    wardsPlaced = json['wardsPlaced'];
    win = json['win'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allInPings'] = this.allInPings;
    data['assistMePings'] = this.assistMePings;
    data['assists'] = this.assists;
    data['baronKills'] = this.baronKills;
    data['basicPings'] = this.basicPings;
    data['bountyLevel'] = this.bountyLevel;
    data['champExperience'] = this.champExperience;
    data['champLevel'] = this.champLevel;
    data['championId'] = this.championId;
    data['championName'] = this.championName;
    data['championTransform'] = this.championTransform;
    data['commandPings'] = this.commandPings;
    data['consumablesPurchased'] = this.consumablesPurchased;
    data['damageDealtToBuildings'] = this.damageDealtToBuildings;
    data['damageDealtToObjectives'] = this.damageDealtToObjectives;
    data['damageDealtToTurrets'] = this.damageDealtToTurrets;
    data['damageSelfMitigated'] = this.damageSelfMitigated;
    data['dangerPings'] = this.dangerPings;
    data['deaths'] = this.deaths;
    data['detectorWardsPlaced'] = this.detectorWardsPlaced;
    data['doubleKills'] = this.doubleKills;
    data['dragonKills'] = this.dragonKills;
    data['eligibleForProgression'] = this.eligibleForProgression;
    data['enemyMissingPings'] = this.enemyMissingPings;
    data['enemyVisionPings'] = this.enemyVisionPings;
    data['firstBloodAssist'] = this.firstBloodAssist;
    data['firstBloodKill'] = this.firstBloodKill;
    data['firstTowerAssist'] = this.firstTowerAssist;
    data['firstTowerKill'] = this.firstTowerKill;
    data['gameEndedInEarlySurrender'] = this.gameEndedInEarlySurrender;
    data['gameEndedInSurrender'] = this.gameEndedInSurrender;
    data['getBackPings'] = this.getBackPings;
    data['goldEarned'] = this.goldEarned;
    data['goldSpent'] = this.goldSpent;
    data['holdPings'] = this.holdPings;
    data['individualPosition'] = this.individualPosition;
    data['inhibitorKills'] = this.inhibitorKills;
    data['inhibitorTakedowns'] = this.inhibitorTakedowns;
    data['inhibitorsLost'] = this.inhibitorsLost;
    data['item0'] = this.item0;
    data['item1'] = this.item1;
    data['item2'] = this.item2;
    data['item3'] = this.item3;
    data['item4'] = this.item4;
    data['item5'] = this.item5;
    data['item6'] = this.item6;
    data['itemsPurchased'] = this.itemsPurchased;
    data['killingSprees'] = this.killingSprees;
    data['kills'] = this.kills;
    data['lane'] = this.lane;
    data['largestCriticalStrike'] = this.largestCriticalStrike;
    data['largestKillingSpree'] = this.largestKillingSpree;
    data['largestMultiKill'] = this.largestMultiKill;
    data['longestTimeSpentLiving'] = this.longestTimeSpentLiving;
    data['magicDamageDealt'] = this.magicDamageDealt;
    data['magicDamageDealtToChampions'] = this.magicDamageDealtToChampions;
    data['magicDamageTaken'] = this.magicDamageTaken;
    if (this.missions != null) {
      data['missions'] = this.missions!.toJson();
    }
    data['needVisionPings'] = this.needVisionPings;
    data['neutralMinionsKilled'] = this.neutralMinionsKilled;
    data['nexusKills'] = this.nexusKills;
    data['nexusLost'] = this.nexusLost;
    data['nexusTakedowns'] = this.nexusTakedowns;
    data['objectivesStolen'] = this.objectivesStolen;
    data['objectivesStolenAssists'] = this.objectivesStolenAssists;
    data['onMyWayPings'] = this.onMyWayPings;
    data['participantId'] = this.participantId;
    data['pentaKills'] = this.pentaKills;
    if (this.perks != null) {
      data['perks'] = this.perks!.toJson();
    }
    data['physicalDamageDealt'] = this.physicalDamageDealt;
    data['physicalDamageDealtToChampions'] =
        this.physicalDamageDealtToChampions;
    data['physicalDamageTaken'] = this.physicalDamageTaken;
    data['placement'] = this.placement;
    data['playerAugment1'] = this.playerAugment1;
    data['playerAugment2'] = this.playerAugment2;
    data['playerAugment3'] = this.playerAugment3;
    data['playerAugment4'] = this.playerAugment4;
    data['playerScore0'] = this.playerScore0;
    data['playerScore1'] = this.playerScore1;
    data['playerScore10'] = this.playerScore10;
    data['playerScore11'] = this.playerScore11;
    data['playerScore2'] = this.playerScore2;
    data['playerScore3'] = this.playerScore3;
    data['playerScore4'] = this.playerScore4;
    data['playerScore5'] = this.playerScore5;
    data['playerScore6'] = this.playerScore6;
    data['playerScore7'] = this.playerScore7;
    data['playerScore8'] = this.playerScore8;
    data['playerScore9'] = this.playerScore9;
    data['playerSubteamId'] = this.playerSubteamId;
    data['profileIcon'] = this.profileIcon;
    data['pushPings'] = this.pushPings;
    data['puuid'] = this.puuid;
    data['quadraKills'] = this.quadraKills;
    data['riotIdGameName'] = this.riotIdGameName;
    data['riotIdTagline'] = this.riotIdTagline;
    data['role'] = this.role;
    data['sightWardsBoughtInGame'] = this.sightWardsBoughtInGame;
    data['spell1Casts'] = this.spell1Casts;
    data['spell2Casts'] = this.spell2Casts;
    data['spell3Casts'] = this.spell3Casts;
    data['spell4Casts'] = this.spell4Casts;
    data['subteamPlacement'] = this.subteamPlacement;
    data['summoner1Casts'] = this.summoner1Casts;
    data['summoner1Id'] = this.summoner1Id;
    data['summoner2Casts'] = this.summoner2Casts;
    data['summoner2Id'] = this.summoner2Id;
    data['summonerId'] = this.summonerId;
    data['summonerLevel'] = this.summonerLevel;
    data['summonerName'] = this.summonerName;
    data['teamEarlySurrendered'] = this.teamEarlySurrendered;
    data['teamId'] = this.teamId;
    data['teamPosition'] = this.teamPosition;
    data['timeCCingOthers'] = this.timeCCingOthers;
    data['timePlayed'] = this.timePlayed;
    data['totalAllyJungleMinionsKilled'] = this.totalAllyJungleMinionsKilled;
    data['totalDamageDealt'] = this.totalDamageDealt;
    data['totalDamageDealtToChampions'] = this.totalDamageDealtToChampions;
    data['totalDamageShieldedOnTeammates'] =
        this.totalDamageShieldedOnTeammates;
    data['totalDamageTaken'] = this.totalDamageTaken;
    data['totalEnemyJungleMinionsKilled'] = this.totalEnemyJungleMinionsKilled;
    data['totalHeal'] = this.totalHeal;
    data['totalHealsOnTeammates'] = this.totalHealsOnTeammates;
    data['totalMinionsKilled'] = this.totalMinionsKilled;
    data['totalTimeCCDealt'] = this.totalTimeCCDealt;
    data['totalTimeSpentDead'] = this.totalTimeSpentDead;
    data['totalUnitsHealed'] = this.totalUnitsHealed;
    data['tripleKills'] = this.tripleKills;
    data['trueDamageDealt'] = this.trueDamageDealt;
    data['trueDamageDealtToChampions'] = this.trueDamageDealtToChampions;
    data['trueDamageTaken'] = this.trueDamageTaken;
    data['turretKills'] = this.turretKills;
    data['turretTakedowns'] = this.turretTakedowns;
    data['turretsLost'] = this.turretsLost;
    data['unrealKills'] = this.unrealKills;
    data['visionClearedPings'] = this.visionClearedPings;
    data['visionScore'] = this.visionScore;
    data['visionWardsBoughtInGame'] = this.visionWardsBoughtInGame;
    data['wardsKilled'] = this.wardsKilled;
    data['wardsPlaced'] = this.wardsPlaced;
    data['win'] = this.win;
    return data;
  }
}

extension ParticipantModelExt on ParticipantModel {
  SummonerSpell? get spellD => SummonerSpell.values.firstWhereOrNull((e) => e.id == summoner1Id);
  SummonerSpell? get spellF => SummonerSpell.values.firstWhereOrNull((e) => e.id == summoner2Id);

  RuneType? get mainRune {
    final mainRuneId = perks
        ?.styles
        ?.firstWhereOrNull((e) => e.description == 'primaryStyle')
        ?.style;
    return RuneType.values.firstWhereOrNull((r) => r.id == mainRuneId);
  }
  RuneType? get subRune {
    final mainRuneId = perks
        ?.styles
        ?.firstWhereOrNull((e) => e.description == 'subStyle')
        ?.style;
    return RuneType.values.firstWhereOrNull((r) => r.id == mainRuneId);
  }

  double get grade => (kills ?? 0 + (assists ?? 0)) / (deaths ?? 0);

  // doubel get killInvolvement => (kills + assists) / total
}
/// 큐 타입 / 몇일전 / 승패 / 게임시간
///
/// 챔피언 이미지 / 챔피언 레벨 / 스펠 2개 / 룬특 2개 / 킬 / 데스 / 어시
/// 평점 / 아이템 7개 / op스코어 (계산 생각)
///
/// 킬관여 / 제어와드 / 토탈 cs, 분당 cs / 티어
///
/// 팀원들 / 적팀원들 (챔프 이미지 + 닉네임)

/// 챔피언 프로필, 챔피언 레벨, 스펠 이미지 2장, 룬특 2개, 아이디, 티어
/// 유저 킬관여 = 킬 + 어시 / 토탈 킬
/// 유저 평점 = 킬 + 어시 / 데스
/// 가한 피해량 / 받은 피해량
/// 제어와드 / 와드 설치 / 와드 제거
/// 토탈 cs / 분당 cs
/// 아이템 이미지 7개