import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_info_model.freezed.dart';
part 'match_info_model.g.dart';

@freezed
class MatchInfoModel with _$MatchInfoModel {
  factory MatchInfoModel({
    required String gameMode,
  }) = _MatchInfoModel;

  factory MatchInfoModel.fromJson(Map<String, dynamic> json) => _$MatchInfoModelFromJson(json);
}