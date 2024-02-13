import 'package:freezed_annotation/freezed_annotation.dart';

// part 'meta_data_model.freezed.dart';
// part 'meta_data_model.g.dart';
//
// @freezed
// class MetaDataModel with _$MetaDataModel {
//   factory MetaDataModel({
//     required String dataVersion,
//     required String matchId,
//     required List<String> participants,
//   }) = _MetaDataModel;
//
//   factory MetaDataModel.fromJson(Map<String, dynamic> json) => _$MetaDataModelFromJson(json);
// }

class MetadataModel {
  String? dataVersion;
  String? matchId;
  List<String>? participants;

  MetadataModel({this.dataVersion, this.matchId, this.participants});

  MetadataModel.fromJson(Map<String, dynamic> json) {
    dataVersion = json['dataVersion'];
    matchId = json['matchId'];
    participants = json['participants'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataVersion'] = dataVersion;
    data['matchId'] = matchId;
    data['participants'] = participants;
    return data;
  }
}