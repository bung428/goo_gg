import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_object_model.freezed.dart';
part 'game_object_model.g.dart';

@freezed
class GameObjectModel with _$GameObjectModel {
  factory GameObjectModel({
    required bool first,
    required int kills,
  }) = _GameObjectModel;

  factory GameObjectModel.fromJson(Map<String, dynamic> json) => _$GameObjectModelFromJson(json);
}