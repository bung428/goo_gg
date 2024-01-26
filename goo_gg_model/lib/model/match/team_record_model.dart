import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/ban_model.dart';
import 'package:goo_gg_model/model/match/game_object_record_model.dart';

part 'team_record_model.freezed.dart';
part 'team_record_model.g.dart';

@freezed
class TeamRecordModel with _$TeamRecordModel {
  factory TeamRecordModel({
    List<BanModel>? bans,
    required GameObjectRecordModel objectives,
    required int teamId,
    required bool win,
  }) = _TeamRecordModel;

  factory TeamRecordModel.fromJson(Map<String, dynamic> json) => _$TeamRecordModelFromJson(json);
}