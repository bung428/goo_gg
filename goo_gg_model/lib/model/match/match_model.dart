import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/model/match/match_info_model.dart';
import 'package:goo_gg_model/model/match/meta_data_model.dart';

// part 'match_model.freezed.dart';
// part 'match_model.g.dart';
//
// @freezed
// class MatchModel with _$MatchModel {
//   factory MatchModel({
//     required MetaDataModel metadata,
//     required MatchInfoModel info,
//   }) = _MatchModel;
//
//   factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
// }

class MatchModel {
  MetadataModel? metadata;
  MatchInfoModel? info;

  MatchModel({this.metadata, this.info});

  MatchModel.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? MetadataModel.fromJson(json['metadata']) : null;
    info = json['info'] != null
        ? MatchInfoModel.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}