import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_perks_model.freezed.dart';
part 'stat_perks_model.g.dart';

@freezed
class StatPerksModel with _$StatPerksModel {
  factory StatPerksModel({
    required int defense,
    required int flex,
    required int offense,
  }) = _StatPerksModel;

  factory StatPerksModel.fromJson(Map<String, dynamic> json) => _$StatPerksModelFromJson(json);
}