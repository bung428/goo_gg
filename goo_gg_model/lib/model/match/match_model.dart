import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/match_info_model.dart';
import 'package:goo_gg_model/model/match/meta_data_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel {
  factory MatchModel({
    required MetaDataModel? metaData,
    required MatchInfoModel? info,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
}