import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/perk/perk_info_model.dart';
import 'package:collection/collection.dart';

part 'perk_style_model.freezed.dart';
part 'perk_style_model.g.dart';

@freezed
class PerkStyleModel with _$PerkStyleModel {
  factory PerkStyleModel({
    required String description,
    required int style,
    required List<PerkInfoModel> selections,
  }) = _PerkStyleModel;

  factory PerkStyleModel.fromJson(Map<String, dynamic> json) => _$PerkStyleModelFromJson(json);
}