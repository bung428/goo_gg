import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goo_gg_model/util/timestamp_converter.dart';

part 'matchId_model.freezed.dart';
part 'matchId_model.g.dart';

@freezed
class MatchIdModel with _$MatchIdModel {
  factory MatchIdModel({
    required List<String> matchIds,
    @RequiredFirestoreTimestampJsonConverter()
    required DateTime updatedAt,
  }) = _MatchIdModel;

factory MatchIdModel.fromJson(Map<String, dynamic> json) => _$MatchIdModelFromJson(json);
}