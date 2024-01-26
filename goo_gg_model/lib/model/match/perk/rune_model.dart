import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/perk/perk_style_model.dart';
import 'package:goo_gg_model/model/match/perk/stat_perks_model.dart';

part 'rune_model.freezed.dart';
part 'rune_model.g.dart';

@freezed
class RuneModel with _$RuneModel {
  factory RuneModel({
    required StatPerksModel statPerks,
    required List<PerkStyleModel> styles,
  }) = _RuneModel;

  factory RuneModel.fromJson(Map<String, dynamic> json) => _$RuneModelFromJson(json);
}