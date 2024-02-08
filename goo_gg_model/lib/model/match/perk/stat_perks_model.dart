import 'package:freezed_annotation/freezed_annotation.dart';

// part 'stat_perks_model.freezed.dart';
// part 'stat_perks_model.g.dart';
//
// @freezed
// class StatPerksModel with _$StatPerksModel {
//   factory StatPerksModel({
//     required int defense,
//     required int flex,
//     required int offense,
//   }) = _StatPerksModel;
//
//   factory StatPerksModel.fromJson(Map<String, dynamic> json) => _$StatPerksModelFromJson(json);
// }

class StatPerksModel {
  int? defense;
  int? flex;
  int? offense;

  StatPerksModel({this.defense, this.flex, this.offense});

  StatPerksModel.fromJson(Map<String, dynamic> json) {
    defense = json['defense'];
    flex = json['flex'];
    offense = json['offense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defense'] = this.defense;
    data['flex'] = this.flex;
    data['offense'] = this.offense;
    return data;
  }
}