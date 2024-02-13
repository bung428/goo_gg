import 'package:freezed_annotation/freezed_annotation.dart';

part 'ban_model.freezed.dart';
part 'ban_model.g.dart';

@freezed
class BanModel with _$BanModel {
  factory BanModel({
    bool? first,
    int? kills,
  }) = _BanModel;

  factory BanModel.fromJson(Map<String, dynamic> json) => _$BanModelFromJson(json);
}