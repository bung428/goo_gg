import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data_model.freezed.dart';
part 'meta_data_model.g.dart';

@freezed
class MetaDataModel with _$MetaDataModel {
  factory MetaDataModel({
    required String dataVersion,
    required String matchId,
    required List<String> participants,
  }) = _MetaDataModel;

  factory MetaDataModel.fromJson(Map<String, dynamic> json) => _$MetaDataModelFromJson(json);
}