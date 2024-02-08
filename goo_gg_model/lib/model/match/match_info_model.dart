import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/enum/game_type.dart';
import 'package:goo_gg_model/model/match/participant_model.dart';
import 'package:goo_gg_model/model/match/team_record_model.dart';
import 'package:goo_gg_model/util/json_converter.dart';

// part 'match_info_model.freezed.dart';
// part 'match_info_model.g.dart';
//
// @freezed
// class MatchInfoModel with _$MatchInfoModel {
//   factory MatchInfoModel({
//     required double gameId,
//     required int queueId,
//     required int mapId,
//     required String gameMode,
//     required String gameName,
//     required String gameType,
//     required String gameVersion,
//     required String tournamentCode,
//     required int gameDuration,
//     @EpochDateTimeConverter() required DateTime gameCreation,
//     @EpochDateTimeConverter() required DateTime gameEndTimestamp,
//     @EpochDateTimeConverter() required DateTime gameStartTimestamp,
//     required List<ParticipantModel> participants,
//     required List<TeamRecordModel> teams,
//   }) = _MatchInfoModel;
//
//   factory MatchInfoModel.fromJson(Map<String, dynamic> json) => _$MatchInfoModelFromJson(json);
// }

class MatchInfoModel {
  DateTime? gameCreation;
  double? gameDuration;
  DateTime? gameEndTimestamp;
  double? gameId;
  String? gameMode;
  String? gameName;
  DateTime? gameStartTimestamp;
  String? gameType;
  String? gameVersion;
  int? mapId;
  List<ParticipantModel>? participants;
  String? platformId;
  int? queueId;
  List<TeamRecordModel>? teams;
  String? tournamentCode;

  MatchInfoModel({
    this.gameCreation,
    this.gameDuration,
    this.gameEndTimestamp,
    this.gameId,
    this.gameMode,
    this.gameName,
    this.gameStartTimestamp,
    this.gameType,
    this.gameVersion,
    this.mapId,
    this.participants,
    this.platformId,
    this.queueId,
    this.teams,
    this.tournamentCode
  });

  MatchInfoModel.fromJson(Map<String, dynamic> json) {
    gameCreation = DateTime.fromMillisecondsSinceEpoch(json['gameCreation']);
    gameDuration = json['gameDuration'];
    gameEndTimestamp = DateTime.fromMillisecondsSinceEpoch(json['gameEndTimestamp']);
    gameId = json['gameId'];
    gameMode = json['gameMode'];
    gameName = json['gameName'];
    gameStartTimestamp = DateTime.fromMillisecondsSinceEpoch(json['gameStartTimestamp']);;
    gameType = json['gameType'];
    gameVersion = json['gameVersion'];
    mapId = json['mapId'];
    if (json['participants'] != null) {
      participants = <ParticipantModel>[];
      json['participants'].forEach((v) {
        participants!.add(ParticipantModel.fromJson(v));
      });
    }
    platformId = json['platformId'];
    queueId = json['queueId'];
    if (json['teams'] != null) {
      teams = <TeamRecordModel>[];
      json['teams'].forEach((v) {
        teams!.add(TeamRecordModel.fromJson(v));
      });
    }
    tournamentCode = json['tournamentCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameCreation'] = gameCreation?.millisecondsSinceEpoch;
    data['gameDuration'] = gameDuration;
    data['gameEndTimestamp'] = gameEndTimestamp?.millisecondsSinceEpoch;
    data['gameId'] = gameId;
    data['gameMode'] = gameMode;
    data['gameName'] = gameName;
    data['gameStartTimestamp'] = gameStartTimestamp?.millisecondsSinceEpoch;
    data['gameType'] = gameType;
    data['gameVersion'] = gameVersion;
    data['mapId'] = mapId;
    if (participants != null) {
      data['participants'] = participants!.map((v) => v.toJson()).toList();
    }
    data['platformId'] = platformId;
    data['queueId'] = queueId;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['tournamentCode'] = tournamentCode;
    return data;
  }
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
    if (gameStartTimestamp == null || gameEndTimestamp == null) return '';
    final diff = gameEndTimestamp!.difference(gameStartTimestamp!);
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
    if (participants == null) return -1;
    final blueKills = participants!.sublist(0, 5).map((e) => e.kills).toList();
    return blueKills.fold(0, (sum, value) => sum + (value ?? 0));
  }

  int get redTotalKill {
    if (participants == null) return -1;
    final redKills = participants!.sublist(5).map((e) => e.kills).toList();
    return redKills.fold(0, (sum, value) => sum + (value ?? 0));
  }
  
  List<String?> get champUrls => participants?.map((e) => e.championName).toList() ?? [];
}