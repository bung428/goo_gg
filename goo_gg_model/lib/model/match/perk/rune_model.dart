import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/perk/perk_style_model.dart';
import 'package:goo_gg_model/model/match/perk/stat_perks_model.dart';

// part 'rune_model.freezed.dart';
// part 'rune_model.g.dart';
//
// @freezed
// class RuneModel with _$RuneModel {
//   factory RuneModel({
//     required StatPerksModel statPerks,
//     required List<PerkStyleModel> styles,
//   }) = _RuneModel;
//
//   factory RuneModel.fromJson(Map<String, dynamic> json) => _$RuneModelFromJson(json);
// }

class RuneModel {
  StatPerksModel? statPerks;
  List<PerkStyleModel>? styles;

  RuneModel({this.statPerks, this.styles});

  RuneModel.fromJson(Map<String, dynamic> json) {
    statPerks = json['statPerks'] != null
        ? new StatPerksModel.fromJson(json['statPerks'])
        : null;
    if (json['styles'] != null) {
      styles = <PerkStyleModel>[];
      json['styles'].forEach((v) {
        styles!.add(new PerkStyleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statPerks != null) {
      data['statPerks'] = this.statPerks!.toJson();
    }
    if (this.styles != null) {
      data['styles'] = this.styles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}