import 'package:freezed_annotation/freezed_annotation.dart';

// part 'game_object_model.freezed.dart';
// part 'game_object_model.g.dart';
//
// @freezed
// class GameObjectModel with _$GameObjectModel {
//   factory GameObjectModel({
//     required bool first,
//     required int kills,
//   }) = _GameObjectModel;
//
//   factory GameObjectModel.fromJson(Map<String, dynamic> json) => _$GameObjectModelFromJson(json);
// }

class GameObjectModel {
  bool? first;
  int? kills;

  GameObjectModel({this.first, this.kills});

  GameObjectModel.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    kills = json['kills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['kills'] = this.kills;
    return data;
  }
}