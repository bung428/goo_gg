import 'package:collection/collection.dart';
import 'package:goo_gg_model/model/riot/match/perk/perk_info_model.dart';

// part 'perk_style_model.freezed.dart';
// part 'perk_style_model.g.dart';
//
// @freezed
// class PerkStyleModel with _$PerkStyleModel {
//   factory PerkStyleModel({
//     required String description,
//     required int style,
//     required List<PerkInfoModel> selections,
//   }) = _PerkStyleModel;
//
//   factory PerkStyleModel.fromJson(Map<String, dynamic> json) => _$PerkStyleModelFromJson(json);
// }

class PerkStyleModel {
  String? description;
  List<PerkInfoModel>? selections;
  int? style;

  PerkStyleModel({this.description, this.selections, this.style});

  PerkStyleModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['selections'] != null) {
      selections = <PerkInfoModel>[];
      json['selections'].forEach((v) {
        selections!.add(new PerkInfoModel.fromJson(v));
      });
    }
    style = json['style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.selections != null) {
      data['selections'] = this.selections!.map((v) => v.toJson()).toList();
    }
    data['style'] = this.style;
    return data;
  }
}