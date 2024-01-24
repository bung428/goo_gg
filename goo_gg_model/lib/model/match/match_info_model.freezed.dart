// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchInfoModel _$MatchInfoModelFromJson(Map<String, dynamic> json) {
  return _MatchInfoModel.fromJson(json);
}

/// @nodoc
mixin _$MatchInfoModel {
  String get gameMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchInfoModelCopyWith<MatchInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchInfoModelCopyWith<$Res> {
  factory $MatchInfoModelCopyWith(
          MatchInfoModel value, $Res Function(MatchInfoModel) then) =
      _$MatchInfoModelCopyWithImpl<$Res, MatchInfoModel>;
  @useResult
  $Res call({String gameMode});
}

/// @nodoc
class _$MatchInfoModelCopyWithImpl<$Res, $Val extends MatchInfoModel>
    implements $MatchInfoModelCopyWith<$Res> {
  _$MatchInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameMode = null,
  }) {
    return _then(_value.copyWith(
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchInfoModelImplCopyWith<$Res>
    implements $MatchInfoModelCopyWith<$Res> {
  factory _$$MatchInfoModelImplCopyWith(_$MatchInfoModelImpl value,
          $Res Function(_$MatchInfoModelImpl) then) =
      __$$MatchInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gameMode});
}

/// @nodoc
class __$$MatchInfoModelImplCopyWithImpl<$Res>
    extends _$MatchInfoModelCopyWithImpl<$Res, _$MatchInfoModelImpl>
    implements _$$MatchInfoModelImplCopyWith<$Res> {
  __$$MatchInfoModelImplCopyWithImpl(
      _$MatchInfoModelImpl _value, $Res Function(_$MatchInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameMode = null,
  }) {
    return _then(_$MatchInfoModelImpl(
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchInfoModelImpl implements _MatchInfoModel {
  _$MatchInfoModelImpl({required this.gameMode});

  factory _$MatchInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchInfoModelImplFromJson(json);

  @override
  final String gameMode;

  @override
  String toString() {
    return 'MatchInfoModel(gameMode: $gameMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchInfoModelImpl &&
            (identical(other.gameMode, gameMode) ||
                other.gameMode == gameMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchInfoModelImplCopyWith<_$MatchInfoModelImpl> get copyWith =>
      __$$MatchInfoModelImplCopyWithImpl<_$MatchInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchInfoModelImplToJson(
      this,
    );
  }
}

abstract class _MatchInfoModel implements MatchInfoModel {
  factory _MatchInfoModel({required final String gameMode}) =
      _$MatchInfoModelImpl;

  factory _MatchInfoModel.fromJson(Map<String, dynamic> json) =
      _$MatchInfoModelImpl.fromJson;

  @override
  String get gameMode;
  @override
  @JsonKey(ignore: true)
  _$$MatchInfoModelImplCopyWith<_$MatchInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
