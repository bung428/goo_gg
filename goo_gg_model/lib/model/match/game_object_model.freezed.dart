// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_object_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameObjectModel _$GameObjectModelFromJson(Map<String, dynamic> json) {
  return _GameObjectModel.fromJson(json);
}

/// @nodoc
mixin _$GameObjectModel {
  bool get first => throw _privateConstructorUsedError;
  int get kills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameObjectModelCopyWith<GameObjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameObjectModelCopyWith<$Res> {
  factory $GameObjectModelCopyWith(
          GameObjectModel value, $Res Function(GameObjectModel) then) =
      _$GameObjectModelCopyWithImpl<$Res, GameObjectModel>;
  @useResult
  $Res call({bool first, int kills});
}

/// @nodoc
class _$GameObjectModelCopyWithImpl<$Res, $Val extends GameObjectModel>
    implements $GameObjectModelCopyWith<$Res> {
  _$GameObjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? kills = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool,
      kills: null == kills
          ? _value.kills
          : kills // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameObjectModelImplCopyWith<$Res>
    implements $GameObjectModelCopyWith<$Res> {
  factory _$$GameObjectModelImplCopyWith(_$GameObjectModelImpl value,
          $Res Function(_$GameObjectModelImpl) then) =
      __$$GameObjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool first, int kills});
}

/// @nodoc
class __$$GameObjectModelImplCopyWithImpl<$Res>
    extends _$GameObjectModelCopyWithImpl<$Res, _$GameObjectModelImpl>
    implements _$$GameObjectModelImplCopyWith<$Res> {
  __$$GameObjectModelImplCopyWithImpl(
      _$GameObjectModelImpl _value, $Res Function(_$GameObjectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? kills = null,
  }) {
    return _then(_$GameObjectModelImpl(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool,
      kills: null == kills
          ? _value.kills
          : kills // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameObjectModelImpl implements _GameObjectModel {
  _$GameObjectModelImpl({required this.first, required this.kills});

  factory _$GameObjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameObjectModelImplFromJson(json);

  @override
  final bool first;
  @override
  final int kills;

  @override
  String toString() {
    return 'GameObjectModel(first: $first, kills: $kills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameObjectModelImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.kills, kills) || other.kills == kills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, kills);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameObjectModelImplCopyWith<_$GameObjectModelImpl> get copyWith =>
      __$$GameObjectModelImplCopyWithImpl<_$GameObjectModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameObjectModelImplToJson(
      this,
    );
  }
}

abstract class _GameObjectModel implements GameObjectModel {
  factory _GameObjectModel(
      {required final bool first,
      required final int kills}) = _$GameObjectModelImpl;

  factory _GameObjectModel.fromJson(Map<String, dynamic> json) =
      _$GameObjectModelImpl.fromJson;

  @override
  bool get first;
  @override
  int get kills;
  @override
  @JsonKey(ignore: true)
  _$$GameObjectModelImplCopyWith<_$GameObjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
