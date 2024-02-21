import 'package:goo_gg_model/model/riot/match/ban_model.dart';
import 'package:goo_gg_model/model/riot/match/enum/object_type.dart';
import 'package:goo_gg_model/model/riot/match/game_object_record_model.dart';
import 'package:goo_gg_model/model/riot/match/object_count_model.dart';

// part 'team_record_model.freezed.dart';
// part 'team_record_model.g.dart';
//
// @freezed
// class TeamRecordModel with _$TeamRecordModel {
//   factory TeamRecordModel({
//     List<BanModel>? bans,
//     required GameObjectRecordModel objectives,
//     required int teamId,
//     required bool win,
//   }) = _TeamRecordModel;
//
//   factory TeamRecordModel.fromJson(Map<String, dynamic> json) => _$TeamRecordModelFromJson(json);
// }

class TeamRecordModel {
  List<BanModel>? bans;
  GameObjectRecordModel? objectives;
  int? teamId;
  bool? win;

  TeamRecordModel({this.bans, this.objectives, this.teamId, this.win});

  TeamRecordModel.fromJson(Map<String, dynamic> json) {
    if (json['bans'] != null) {
      bans = <BanModel>[];
      json['bans'].forEach((v) {
        bans!.add(BanModel.fromJson(v));
      });
    }
    objectives = json['objectives'] != null
        ? GameObjectRecordModel.fromJson(json['objectives'])
        : null;
    teamId = json['teamId'];
    win = json['win'];
  }

  List<ObjectCountModel> get objects => [
    ObjectCountModel(type: ObjectType.baron, count: objectives?.baron?.kills ?? 0),
    ObjectCountModel(type: ObjectType.dragon, count: objectives?.dragon?.kills ?? 0),
    ObjectCountModel(type: ObjectType.horde, count: objectives?.horde?.kills ?? 0),
    ObjectCountModel(type: ObjectType.riftHerald, count: objectives?.riftHerald?.kills ?? 0),
  ];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bans != null) {
      data['bans'] = this.bans!.map((v) => v.toJson()).toList();
    }
    if (this.objectives != null) {
      data['objectives'] = this.objectives!.toJson();
    }
    data['teamId'] = this.teamId;
    data['win'] = this.win;
    return data;
  }
}