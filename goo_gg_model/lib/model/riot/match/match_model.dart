import 'match_info_model.dart';
import 'meta_data_model.dart';

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
  late String matchId;
  MetadataModel? metadata;
  MatchInfoModel? info;

  MatchModel({required this.matchId, this.metadata, this.info});

  MatchModel.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
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
    data['matchId'] = matchId;
    return data;
  }
}