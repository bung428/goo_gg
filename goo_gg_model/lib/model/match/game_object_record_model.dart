import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/game_object_model.dart';

// part 'game_object_record_model.freezed.dart';
// part 'game_object_record_model.g.dart';
//
// @freezed
// class GameObjectRecordModel with _$GameObjectRecordModel {
//   factory GameObjectRecordModel({
//     required GameObjectModel baron,
//     required GameObjectModel champion,
//     required GameObjectModel dragon,
//     required GameObjectModel horde,
//     required GameObjectModel inhibitor,
//     required GameObjectModel riftHerald,
//     required GameObjectModel tower,
//   }) = _GameObjectRecordModel;
//
//   factory GameObjectRecordModel.fromJson(Map<String, dynamic> json) => _$GameObjectRecordModelFromJson(json);
// }

class GameObjectRecordModel {
  GameObjectModel? baron;
  GameObjectModel? champion;
  GameObjectModel? dragon;
  GameObjectModel? horde;
  GameObjectModel? inhibitor;
  GameObjectModel? riftHerald;
  GameObjectModel? tower;

  GameObjectRecordModel(
      {this.baron,
        this.champion,
        this.dragon,
        this.horde,
        this.inhibitor,
        this.riftHerald,
        this.tower});

  GameObjectRecordModel.fromJson(Map<String, dynamic> json) {
    baron = json['baron'] != null ? new GameObjectModel.fromJson(json['baron']) : null;
    champion =
    json['champion'] != null ? new GameObjectModel.fromJson(json['champion']) : null;
    dragon = json['dragon'] != null ? new GameObjectModel.fromJson(json['dragon']) : null;
    horde = json['horde'] != null ? new GameObjectModel.fromJson(json['horde']) : null;
    inhibitor = json['inhibitor'] != null
        ? new GameObjectModel.fromJson(json['inhibitor'])
        : null;
    riftHerald = json['riftHerald'] != null
        ? new GameObjectModel.fromJson(json['riftHerald'])
        : null;
    tower = json['tower'] != null ? new GameObjectModel.fromJson(json['tower']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.baron != null) {
      data['baron'] = this.baron!.toJson();
    }
    if (this.champion != null) {
      data['champion'] = this.champion!.toJson();
    }
    if (this.dragon != null) {
      data['dragon'] = this.dragon!.toJson();
    }
    if (this.horde != null) {
      data['horde'] = this.horde!.toJson();
    }
    if (this.inhibitor != null) {
      data['inhibitor'] = this.inhibitor!.toJson();
    }
    if (this.riftHerald != null) {
      data['riftHerald'] = this.riftHerald!.toJson();
    }
    if (this.tower != null) {
      data['tower'] = this.tower!.toJson();
    }
    return data;
  }
}