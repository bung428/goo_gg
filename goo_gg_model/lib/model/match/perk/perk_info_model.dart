import 'package:freezed_annotation/freezed_annotation.dart';

// part 'perk_info_model.freezed.dart';
// part 'perk_info_model.g.dart';
//
// @freezed
// class PerkInfoModel with _$PerkInfoModel {
//   factory PerkInfoModel({
//     required int perk,
//     required int var1,
//     required int var2,
//     required int var3,
//   }) = _PerkInfoModel;
//
//   factory PerkInfoModel.fromJson(Map<String, dynamic> json) => _$PerkInfoModelFromJson(json);
// }

class PerkInfoModel {
  int? perk;
  int? var1;
  int? var2;
  int? var3;

  PerkInfoModel({this.perk, this.var1, this.var2, this.var3});

  PerkInfoModel.fromJson(Map<String, dynamic> json) {
    perk = json['perk'];
    var1 = json['var1'];
    var2 = json['var2'];
    var3 = json['var3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['perk'] = this.perk;
    data['var1'] = this.var1;
    data['var2'] = this.var2;
    data['var3'] = this.var3;
    return data;
  }
}