import 'package:goo_gg_application/data/match/enum/game_result.dart';
import 'package:goo_gg_application/data/model/match/game_info_model.dart';
import 'package:goo_gg_application/data/model/match/summoner_record_model.dart';
import 'package:goo_gg_application/data/riot_data_cdn_url.dart';
import 'package:goo_gg_model/model/match/match_info_model.dart';
import 'package:goo_gg_model/model/match/participant_model.dart';

class MatchHistoryModel {
  final GameInfoModel gameInfo;
  final SummonerRecordModel summonerRecord;
  final List<PlayerInfoModel> blueTeam;
  final List<PlayerInfoModel> redTeam;
  final bool expanded;

  MatchHistoryModel({
    required this.gameInfo,
    required this.summonerRecord,
    required this.blueTeam,
    required this.redTeam,
    required this.expanded,
  });

  MatchHistoryModel copyWith({bool? expanded}) => MatchHistoryModel(
    gameInfo: gameInfo,
    summonerRecord: summonerRecord,
    blueTeam: blueTeam,
    redTeam: redTeam,
    expanded: expanded ?? this.expanded
  );
}

extension MatchInfoModelExt on MatchInfoModel {
  GameInfoModel getGameInfoModel(String puuid) {
    final userTeamId = participants.firstWhere((p) => p.puuid == puuid).teamId;
    final win = teams.firstWhere((t) => t.teamId == userTeamId).win;
    return GameInfoModel(
      gameType: gameTypeValue,
      /// 몇 시간전, 몇 일전... 처리해야함.
      finishedAt: gameEndTimestamp,
      gameResult: win ? GameResult.win : GameResult.lose,
      gameDuration: gameTime,
    );
  }

  SummonerRecordModel getSummonerInfoModel(String puuid) {
    final user = participants.firstWhere((p) => p.puuid == puuid);
    return SummonerRecordModel(
      championUrl: DataCdnUrl.getChampionIconUrl(user.championName),
      championLevel: user.champLevel,
      spells: [
        DataCdnUrl.getSpellIconUrl(user.spellD.spellName),
        DataCdnUrl.getSpellIconUrl(user.spellF.spellName)
      ],
      runes: [
        DataCdnUrl.getRuneIconUrl(user.mainRune.url),
        DataCdnUrl.getRuneIconUrl(user.subRune.url),
      ],
      kill: user.kills,
      death: user.deaths,
      assist: user.assists,
      grade: (user.kills + user.assists) / user.deaths,
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
}