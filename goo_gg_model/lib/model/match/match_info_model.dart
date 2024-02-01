import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/enum/game_type.dart';
import 'package:goo_gg_model/model/match/participant_model.dart';
import 'package:goo_gg_model/model/match/team_record_model.dart';
import 'package:goo_gg_model/util/json_converter.dart';

part 'match_info_model.freezed.dart';
part 'match_info_model.g.dart';

@freezed
class MatchInfoModel with _$MatchInfoModel {
  factory MatchInfoModel({
    required double gameId,
    required int queueId,
    required int mapId,
    required String gameMode,
    required String gameName,
    required String gameType,
    required String gameVersion,
    required String tournamentCode,
    required int gameDuration,
    @EpochDateTimeConverter() required DateTime gameCreation,
    @EpochDateTimeConverter() required DateTime gameEndTimestamp,
    @EpochDateTimeConverter() required DateTime gameStartTimestamp,
    required List<ParticipantModel> participants,
    required List<TeamRecordModel> teams,
  }) = _MatchInfoModel;

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) => _$MatchInfoModelFromJson(json);
}

extension MatchInfoModelExt on MatchInfoModel {
  GameType get gameTypeValue => switch (queueId) {
    420 => GameType.soloRank,
    400 => GameType.normalDraft,
    430 => GameType.normal,
    440 => GameType.freeRank,
    450 => GameType.aram,
    (_) => GameType.normal
  };

  String get gameTime {
    final diff = gameEndTimestamp.difference(gameStartTimestamp);
    final minStr = (diff.inMinutes % 60).toString();
    final secStr = (diff.inSeconds % 60).toString();
    final min = minStr.length == 1
        ? '0$minStr' : minStr;
    final sec = secStr.length == 1
        ? '0$secStr' : secStr;
    return diff.inHours > 0
        ? '${diff.inHours}시간 $min분'
        : '$min분 $sec초';
  }

  int get blueTotalKill {
    final blueKills = participants.sublist(0, 5).map((e) => e.kills).toList();
    return blueKills.fold(0, (sum, value) => sum + value);
  }

  int get redTotalKill {
    final redKills = participants.sublist(5).map((e) => e.kills).toList();
    return redKills.fold(0, (sum, value) => sum + value);
  }
  
  List<String> get champUrls => participants.map((e) => e.championName).toList();

  // List<PlayerInfoModel> get blueTeam {
  //   final blueTeam = participants.sublist(0, 4);
  //   return blueTeam
  //       .map((p) => PlayerInfoModel(
  //           puuid: p.puuid,
  //           championName: p.championName,
  //           riotIdGameName: p.riotIdGameName,
  //           participantsIndex: blueTeam.indexOf(p)))
  //       .toList();
  // }
  //
  // List<PlayerInfoModel> get redTeam {
  //   final redTeam = participants.sublist(4);
  //   return redTeam
  //       .map((p) => PlayerInfoModel(
  //           puuid: p.puuid,
  //           championName: p.championName,
  //           riotIdGameName: p.riotIdGameName,
  //           participantsIndex: redTeam.indexOf(p)))
  //       .toList();
  // }
}