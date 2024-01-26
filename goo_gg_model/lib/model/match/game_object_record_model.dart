import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/game_object_model.dart';

part 'game_object_record_model.freezed.dart';
part 'game_object_record_model.g.dart';

@freezed
class GameObjectRecordModel with _$GameObjectRecordModel {
  factory GameObjectRecordModel({
    required GameObjectModel baron,
    required GameObjectModel champion,
    required GameObjectModel dragon,
    required GameObjectModel horde,
    required GameObjectModel inhibitor,
    required GameObjectModel riftHerald,
    required GameObjectModel tower,
  }) = _GameObjectRecordModel;

  factory GameObjectRecordModel.fromJson(Map<String, dynamic> json) => _$GameObjectRecordModelFromJson(json);
}