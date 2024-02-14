import 'dart:ui' as ui;

import 'package:goo_gg_application/data/match/enum/game_result.dart';
import 'package:goo_gg_application/data/match/model/game_analysis_model.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/data/match/model/game_info_model.dart';
import 'package:goo_gg_application/data/match/model/summoner_record_model.dart';
import 'package:goo_gg_application/data/riot_data_cdn_url.dart';
import 'package:goo_gg_model/model/riot/match/match_info_model.dart';
import 'package:goo_gg_model/model/riot/match/participant_model.dart';

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
    expanded: expanded ?? this.expanded,
    summarizedMatch: summarizedMatch,
    gameDetailInfo: gameDetailInfo,
    gameAnalysis: gameAnalysis,
  );
}

class SummarizedMatchModel {
  final String summonerName;
  final GameInfoModel gameInfo;
  final SummonerRecordModel summonerRecord;

  SummarizedMatchModel({
    required this.summonerName,
    required this.gameInfo,
    required this.summonerRecord
  });

}

extension MatchInfoModelExt on MatchInfoModel {
  GameInfoModel getGameInfo(String puuid) {
    final userTeamId = participants?.firstWhere((p) => p.puuid == puuid).teamId;
    final win = teams?.firstWhere((t) => t.teamId == userTeamId).win;
    return GameInfoModel(
      gameType: gameTypeValue,
      finishedAt: gameEndTimestamp,
      gameResult: win != null
          ? win ? GameResult.win : GameResult.lose
          : null,
      gameDuration: gameTime,
      gameMode: gameMode,
    );
  }

  SummonerRecordModel getSummonerInfo(String puuid) {
    final user = participants?.firstWhere((p) => p.puuid == puuid);
    return SummonerRecordModel(
      championUrl: DataCdnUrl.getChampionIconUrl(user?.championName),
      championLevel: user?.champLevel ?? 0,
      spells: [
        DataCdnUrl.getSpellIconUrl(user?.spellD?.spellName),
        DataCdnUrl.getSpellIconUrl(user?.spellF?.spellName)
      ],
      runes: [
        DataCdnUrl.getRuneIconUrl(user?.mainRune?.url),
        DataCdnUrl.getRuneIconUrl(user?.subRune?.url),
      ],
      kill: user?.kills ?? 0,
      death: user?.deaths ?? 0,
      assist: user?.assists ?? 0,
      grade: user?.grade ?? 0,
      items: [
        DataCdnUrl.getItemIconUrl(user?.item0.toString()),
        DataCdnUrl.getItemIconUrl(user?.item1.toString()),
        DataCdnUrl.getItemIconUrl(user?.item2.toString()),
        DataCdnUrl.getItemIconUrl(user?.item3.toString()),
        DataCdnUrl.getItemIconUrl(user?.item4.toString()),
        DataCdnUrl.getItemIconUrl(user?.item5.toString()),
        DataCdnUrl.getItemIconUrl(user?.item6.toString()),
      ]
    );
  }

  GameDetailInfoModel gameDetailInfo() {
    final blueTeam = participants?.sublist(0, 5);
    final redTeam = participants?.sublist(5);
    final isBlue = teams?.firstWhere((t) => t.teamId == blueTeam?.first.teamId);
    final blueGold = blueTeam
        ?.map((e) => e.goldEarned)
        .fold(0, (sum, value) => sum + (value ?? 0));
    final redGold = blueTeam
        ?.map((e) => e.goldEarned)
        .fold(0, (sum, value) => sum + (value ?? 0));
    return GameDetailInfoModel(
      redTeamInfo: redTeam?.map((e) {
        return PlayerInfoModel(
          nickName: '${e.riotIdGameName} #${e.riotIdTagline}',
          championUrl: DataCdnUrl.getChampionIconUrl(e.championName),
          championLevel: e.champLevel,
          kda: '${e.kills} / ${e.deaths} / ${e.assists}',
          grade: e.grade.toStringAsFixed(2),
          gold: e.goldEarned,
          killInvolvement: ((e.kills ?? 0) + (e.assists ?? 0)) / redTotalKill,
          totalCs: (e.totalMinionsKilled ?? 0) + (e.neutralMinionsKilled ?? 0),
          totalCsPerMin: ((e.totalMinionsKilled ?? 0) + (e.neutralMinionsKilled ?? 0))
              / ((gameDuration ?? 0) ~/ 60),
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
      blueTeamInfo: blueTeam?.map((e) {
        return PlayerInfoModel(
            nickName: '${e.riotIdGameName} #${e.riotIdTagline}',
            championUrl: DataCdnUrl.getChampionIconUrl(e.championName),
            championLevel: e.champLevel,
            kda: '${e.kills}/${e.deaths}/${e.assists}',
            grade: e.grade.toStringAsFixed(2),
            gold: e.goldEarned,
            killInvolvement: (e.kills ?? 0 + (e.assists ?? 0)) / blueTotalKill,
            totalCs: (e.totalMinionsKilled ?? 0) + (e.neutralMinionsKilled ?? 0),
            totalCsPerMin: ((e.totalMinionsKilled ?? 0)+ (e.neutralMinionsKilled ?? 0))
                / ((gameDuration ?? 0) ~/ 60),
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
      teamObjectInfo: teams?.map((e) => TeamObjectInfoModel(
        isBlue: e == isBlue,
        win: e.win,
        teamGolds: (e.teamId == blueTeam?.first.teamId ? blueGold : redGold) ?? 0,
        teamKills: (e.objectives?.champion?.kills) ?? 0,
        teamDeaths: (e == isBlue
          ? blueTeam?.map((e) => e.deaths).fold(0, (sum, value) => sum ?? 0 + (value ?? 0))
          : redTeam?.map((e) => e.deaths).fold(0, (sum, value) => sum ?? 0 + (value ?? 0))) ?? 0,
        teamAssists: (e == isBlue
          ? blueTeam?.map((e) => e.assists).fold(0, (sum, value) => sum ?? 0 + (value ?? 0))
          : redTeam?.map((e) => e.assists).fold(0, (sum, value) => sum ?? 0 + (value ?? 0))) ?? 0,
        baron: e.objectives?.baron?.kills ?? 0,
        dragon: e.objectives?.dragon?.kills ?? 0,
        horde: e.objectives?.horde?.kills ?? 0,
        inhibitor: e.objectives?.inhibitor?.kills ?? 0,
        riftHerald: e.objectives?.riftHerald?.kills ?? 0,
        tower: e.objectives?.tower?.kills ?? 0
      )).toList()
    );
  }

  List<GameAnalysisModel> getGameAnalysis(List<ui.Image?> images) {
    if (participants == null) return [];
    return participants!.map((e) {
      final idx = participants!.indexOf(e);
      final url = images[idx];
      return GameAnalysisModel(
          champIconData: url,
          totalDamage: e.damageSelfMitigated ?? 0,
          totalDamageTaken: e.totalDamageTaken ?? 0,
          damageToChampion: e.totalDamageDealtToChampions ?? 0,
          gold: e.goldEarned ?? 0,
          turret: e.turretKills ?? 0,
          visionScore: e.visionScore ?? 0,
          bountyLevel: e.bountyLevel ?? 0
      );
    }).toList();
  }


}