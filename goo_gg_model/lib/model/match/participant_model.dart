import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/enum/rune_type.dart';
import 'package:goo_gg_model/model/match/enum/spell_type.dart';
import 'package:goo_gg_model/model/match/perk/rune_model.dart';

part 'participant_model.freezed.dart';
part 'participant_model.g.dart';

@freezed
class ParticipantModel with _$ParticipantModel {
  factory ParticipantModel({
    required int assists,
    required int baronKills,
    required int bountyLevel, /// 현상금 수준
    required int champExperience,
    required int champLevel,
    required int championId,
    required String championName,
    required int championTransform,
    required int consumablesPurchased,
    required int damageDealtToBuildings,
    required int damageDealtToObjectives,
    required int damageDealtToTurrets,
    required int damageSelfMitigated,
    required int deaths,
    required int detectorWardsPlaced,
    required int doubleKills,
    required int dragonKills,
    required bool firstBloodAssist,
    required bool firstBloodKill,
    required bool firstTowerAssist,
    required bool firstTowerKill,
    required bool gameEndedInEarlySurrender,
    required bool gameEndedInSurrender,
    required int goldEarned,
    required int goldSpent,
    required String individualPosition,
    required int inhibitorKills,
    required int inhibitorTakedowns,
    required int inhibitorsLost,
    required int item0,
    required int item1,
    required int item2,
    required int item3,
    required int item4,
    required int item5,
    required int item6,
    required int itemsPurchased,
    required int killingSprees,
    required int kills,
    required String lane,
    required int largestCriticalStrike,
    required int largestKillingSpree,
    required int largestMultiKill,
    required int longestTimeSpentLiving,
    required int magicDamageDealt,
    required int magicDamageDealtToChampions,
    required int magicDamageTaken,
    required int neutralMinionsKilled,
    required int nexusKills,
    required int nexusTakedowns,
    required int nexusLost,
    required int objectivesStolen,
    required int objectivesStolenAssists,
    required int participantId,
    required int pentaKills,
    required RuneModel perks,
    required int physicalDamageDealt,
    required int physicalDamageDealtToChampions,
    required int physicalDamageTaken,
    required int profileIcon,
    required String puuid,
    required int quadraKills,
    required String riotIdGameName,
    required String riotIdTagline,
    required String role,
    required int sightWardsBoughtInGame,
    required int spell1Casts,
    required int spell2Casts,
    required int spell3Casts,
    required int spell4Casts,
    required int summoner1Casts,
    required int summoner1Id,
    required int summoner2Casts,
    required int summoner2Id,
    required String summonerId,
    required String summonerName,
    required int summonerLevel,
    required bool teamEarlySurrendered,
    required int teamId,
    required String teamPosition,
    required int timeCCingOthers,
    required int timePlayed,
    required int totalDamageDealt,
    required int totalDamageDealtToChampions,
    required int totalDamageShieldedOnTeammates,
    required int totalDamageTaken,
    required int totalHeal,
    required int totalHealsOnTeammates,
    required int totalMinionsKilled,
    required int totalTimeCCDealt,
    required int totalTimeSpentDead,
    required int totalUnitsHealed,
    required int tripleKills,
    required int trueDamageDealt,
    required int trueDamageDealtToChampions,
    required int trueDamageTaken,
    required int turretKills,
    required int turretTakedowns,
    required int turretsLost,
    required int unrealKills,
    required int visionScore,
    required int visionWardsBoughtInGame,
    required int wardsKilled,
    required int wardsPlaced,
    required bool win,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, dynamic> json) => _$ParticipantModelFromJson(json);
}

extension ParticipantModelExt on ParticipantModel {
  SummonerSpell get spellD => SummonerSpell.values.firstWhere((e) => e.id == summoner1Id);
  SummonerSpell get spellF => SummonerSpell.values.firstWhere((e) => e.id == summoner2Id);

  RuneType get mainRune {
    final mainRuneId = perks
        .styles
        .firstWhere((e) => e.description == 'primaryStyle')
        .style;
    return RuneType.values.firstWhere((r) => r.id == mainRuneId);
  }
  RuneType get subRune {
    final mainRuneId = perks
        .styles
        .firstWhere((e) => e.description == 'subStyle')
        .style;
    return RuneType.values.firstWhere((r) => r.id == mainRuneId);
  }
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