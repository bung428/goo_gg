import 'package:freezed_annotation/freezed_annotation.dart';

part 'perk_info_model.freezed.dart';
part 'perk_info_model.g.dart';

@freezed
class PerkInfoModel with _$PerkInfoModel {
  factory PerkInfoModel({
    required int perk,
    required int var1,
    required int var2,
    required int var3,
  }) = _PerkInfoModel;

  factory PerkInfoModel.fromJson(Map<String, dynamic> json) => _$PerkInfoModelFromJson(json);
}