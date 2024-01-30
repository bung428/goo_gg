import 'dart:ui' as ui;

import 'package:goo_gg_application/data/match/enum/game_result.dart';
import 'package:goo_gg_application/data/model/match/game_analysis_model.dart';
import 'package:goo_gg_application/data/model/match/game_detail_info_model.dart';
import 'package:goo_gg_application/data/model/match/game_info_model.dart';
import 'package:goo_gg_application/data/model/match/summoner_record_model.dart';
import 'package:goo_gg_application/data/riot_data_cdn_url.dart';
import 'package:goo_gg_model/model/match/match_info_model.dart';
import 'package:goo_gg_model/model/match/participant_model.dart';

class MatchHistoryModel {
  final bool expanded;
  final SummarizedMatchModel summarizedMatch;
  final GameDetailInfoModel gameDetailInfo;
  final List<GameAnalysisModel> gameAnalysis;

  MatchHistoryModel({
    required this.summarizedMatch,
    required this.expanded,
    required this.gameDetailInfo,
    required this.gameAnalysis,
  });

  MatchHistoryModel copyWith({bool? expanded}) => MatchHistoryModel(
    summarizedMatch: summarizedMatch,
    gameDetailInfo: gameDetailInfo,
    gameAnalysis: gameAnalysis,
    expanded: expanded ?? this.expanded
  );
}

class SummarizedMatchModel {
  final GameInfoModel gameInfo;
  final SummonerRecordModel summonerRecord;

  SummarizedMatchModel({
    required this.gameInfo,
    required this.summonerRecord
  });

}

extension MatchInfoModelExt on MatchInfoModel {
  GameInfoModel getGameInfo(String puuid) {
    final userTeamId = participants.firstWhere((p) => p.puuid == puuid).teamId;
    final win = teams.firstWhere((t) => t.teamId == userTeamId).win;
    return GameInfoModel(
      gameType: gameTypeValue,
      finishedAt: gameEndTimestamp,
      gameResult: win ? GameResult.win : GameResult.lose,
      gameDuration: gameTime,
    );
  }

  SummonerRecordModel getSummonerInfo(String puuid) {
    final user = participants.firstWhere((p) => p.puuid == puuid);
    return SummonerRecordModel(
      championUrl: DataCdnUrl.getChampionIconUrl(user.championName),
      championLevel: user.champLevel,
      spells: [
        DataCdnUrl.getSpellIconUrl(user.spellD?.spellName),
        DataCdnUrl.getSpellIconUrl(user.spellF?.spellName)
      ],
      runes: [
        DataCdnUrl.getRuneIconUrl(user.mainRune?.url),
        DataCdnUrl.getRuneIconUrl(user.subRune?.url),
      ],
      kill: user.kills,
      death: user.deaths,
      assist: user.assists,
      grade: user.grade,
      items: [
        DataCdnUrl.getItemIconUrl(user.item0.toString()),
        DataCdnUrl.getItemIconUrl(user.item1.toString()),
        DataCdnUrl.getItemIconUrl(user.item2.toString()),
        DataCdnUrl.getItemIconUrl(user.item3.toString()),
        DataCdnUrl.getItemIconUrl(user.item4.toString()),
        DataCdnUrl.getItemIconUrl(user.item5.toString()),
        DataCdnUrl.getItemIconUrl(user.item6.toString()),
      ]
    );
  }

  GameDetailInfoModel gameDetailInfo() {
    final blueTeam = participants.sublist(0, 5);
    final redTeam = participants.sublist(5);
    final isBlue = teams.firstWhere((t) => t.teamId == blueTeam.first.teamId);
    final blueGold = blueTeam
        .map((e) => e.goldEarned)
        .fold(0, (sum, value) => sum + value);
    final redGold = blueTeam
        .map((e) => e.goldEarned)
        .fold(0, (sum, value) => sum + value);
    return GameDetailInfoModel(
      redTeamInfo: redTeam.map((e) {
        return PlayerInfoModel(
          nickName: e.summonerName,
          championUrl: DataCdnUrl.getChampionIconUrl(e.championName),
          championLevel: e.champLevel,
          kda: '${e.kills}/${e.deaths}/${e.assists}',
          grade: double.parse('${(e.kills + e.assists) / e.deaths}').toStringAsFixed(2),
          gold: e.goldEarned,
          killInvolvement: (e.kills + e.assists) / redTotalKill,
          totalCs: e.totalMinionsKilled + e.neutralMinionsKilled,
          totalCsPerMin: (e.totalMinionsKilled + e.neutralMinionsKilled) 
              / (gameDuration ~/ 60),
          spells: [
            DataCdnUrl.getSpellIconUrl(e.spellD?.spellName),
            DataCdnUrl.getSpellIconUrl(e.spellF?.spellName)
          ],
          runes: [
            DataCdnUrl.getRuneIconUrl(e.mainRune?.url),
            DataCdnUrl.getRuneIconUrl(e.subRune?.url),
          ],
            items: [
              DataCdnUrl.getItemIconUrl(e.item0.toString()),
              DataCdnUrl.getItemIconUrl(e.item1.toString()),
              DataCdnUrl.getItemIconUrl(e.item2.toString()),
              DataCdnUrl.getItemIconUrl(e.item3.toString()),
              DataCdnUrl.getItemIconUrl(e.item4.toString()),
              DataCdnUrl.getItemIconUrl(e.item5.toString()),
              DataCdnUrl.getItemIconUrl(e.item6.toString()),
            ]
        );
      }).toList(),
      blueTeamInfo: blueTeam.map((e) {
        return PlayerInfoModel(
            nickName: e.summonerName,
            championUrl: DataCdnUrl.getChampionIconUrl(e.championName),
            championLevel: e.champLevel,
            kda: '${e.kills}/${e.deaths}/${e.assists}',
            grade: double.parse('${(e.kills + e.assists) / e.deaths}').toStringAsFixed(2),
            gold: e.goldEarned,
            killInvolvement: (e.kills + e.assists) / blueTotalKill,
            totalCs: e.totalMinionsKilled + e.neutralMinionsKilled,
            totalCsPerMin: (e.totalMinionsKilled + e.neutralMinionsKilled)
                / (gameDuration ~/ 60),
            spells: [
              DataCdnUrl.getSpellIconUrl(e.spellD?.spellName),
              DataCdnUrl.getSpellIconUrl(e.spellF?.spellName)
            ],
            runes: [
              DataCdnUrl.getRuneIconUrl(e.mainRune?.url),
              DataCdnUrl.getRuneIconUrl(e.subRune?.url),
            ],
            items: [
              DataCdnUrl.getItemIconUrl(e.item0.toString()),
              DataCdnUrl.getItemIconUrl(e.item1.toString()),
              DataCdnUrl.getItemIconUrl(e.item2.toString()),
              DataCdnUrl.getItemIconUrl(e.item3.toString()),
              DataCdnUrl.getItemIconUrl(e.item4.toString()),
              DataCdnUrl.getItemIconUrl(e.item5.toString()),
              DataCdnUrl.getItemIconUrl(e.item6.toString()),
            ]
        );
      }).toList(),
      teamObjectInfo: teams.map((e) => TeamObjectInfoModel(
        isBlue: e == isBlue,
        win: e.win,
        teamGolds: e.teamId == blueTeam.first.teamId ? blueGold : redGold,
        teamKills: e.objectives.champion.kills,
        teamDeaths: e == isBlue 
          ? blueTeam.map((e) => e.deaths).fold(0, (sum, value) => sum + value)
          : redTeam.map((e) => e.deaths).fold(0, (sum, value) => sum + value),
        teamAssists: e == isBlue
          ? blueTeam.map((e) => e.assists).fold(0, (sum, value) => sum + value)
          : redTeam.map((e) => e.assists).fold(0, (sum, value) => sum + value),
        baron: e.objectives.baron.kills,
        dragon: e.objectives.dragon.kills,
        horde: e.objectives.horde.kills,
        inhibitor: e.objectives.inhibitor.kills,
        riftHerald: e.objectives.riftHerald.kills,
        tower: e.objectives.tower.kills
      )).toList()
    );
  }

  List<GameAnalysisModel> getGameAnalysis(List<ui.Image?> images) {
    return participants.map((e) {
      final idx = participants.indexOf(e);
      final url = images[idx];
      return GameAnalysisModel(
          champIconData: url,
          totalDamage: e.damageSelfMitigated,
          totalDamageTaken: e.totalDamageTaken,
          damageToChampion: e.totalDamageDealtToChampions,
          gold: e.goldEarned,
          turret: e.turretKills,
          visionScore: e.visionScore,
          bountyLevel: e.bountyLevel
      );
    }).toList();
  }


}