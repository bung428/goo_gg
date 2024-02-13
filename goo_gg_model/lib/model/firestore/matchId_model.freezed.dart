// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchId_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchIdModel _$MatchIdModelFromJson(Map<String, dynamic> json) {
  return _MatchIdModel.fromJson(json);
}

/// @nodoc
mixin _$MatchIdModel {
  List<String> get matchIds => throw _privateConstructorUsedError;
  @RequiredFirestoreTimestampJsonConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchIdModelCopyWith<MatchIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchIdModelCopyWith<$Res> {
  factory $MatchIdModelCopyWith(
          MatchIdModel value, $Res Function(MatchIdModel) then) =
      _$MatchIdModelCopyWithImpl<$Res, MatchIdModel>;
  @useResult
  $Res call(
      {List<String> matchIds,
      @RequiredFirestoreTimestampJsonConverter() DateTime updatedAt});
}

/// @nodoc
class _$MatchIdModelCopyWithImpl<$Res, $Val extends MatchIdModel>
    implements $MatchIdModelCopyWith<$Res> {
  _$MatchIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchIds = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      matchIds: null == matchIds
          ? _value.matchIds
          : matchIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchIdModelImplCopyWith<$Res>
    implements $MatchIdModelCopyWith<$Res> {
  factory _$$MatchIdModelImplCopyWith(
          _$MatchIdModelImpl value, $Res Function(_$MatchIdModelImpl) then) =
      __$$MatchIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> matchIds,
      @RequiredFirestoreTimestampJsonConverter() DateTime updatedAt});
}

/// @nodoc
class __$$MatchIdModelImplCopyWithImpl<$Res>
    extends _$MatchIdModelCopyWithImpl<$Res, _$MatchIdModelImpl>
    implements _$$MatchIdModelImplCopyWith<$Res> {
  __$$MatchIdModelImplCopyWithImpl(
      _$MatchIdModelImpl _value, $Res Function(_$MatchIdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchIds = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MatchIdModelImpl(
      matchIds: null == matchIds
          ? _value._matchIds
          : matchIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchIdModelImpl implements _MatchIdModel {
  _$MatchIdModelImpl(
      {required final List<String> matchIds,
      @RequiredFirestoreTimestampJsonConverter() required this.updatedAt})
      : _matchIds = matchIds;

  factory _$MatchIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchIdModelImplFromJson(json);

  final List<String> _matchIds;
  @override
  List<String> get matchIds {
    if (_matchIds is EqualUnmodifiableListView) return _matchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchIds);
  }

  @override
  @RequiredFirestoreTimestampJsonConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MatchIdModel(matchIds: $matchIds, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchIdModelImpl &&
            const DeepCollectionEquality().equals(other._matchIds, _matchIds) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_matchIds), updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchIdModelImplCopyWith<_$MatchIdModelImpl> get copyWith =>
      __$$MatchIdModelImplCopyWithImpl<_$MatchIdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchIdModelImplToJson(
      this,
    );
  }
}

abstract class _MatchIdModel implements MatchIdModel {
  factory _MatchIdModel(
      {required final List<String> matchIds,
      @RequiredFirestoreTimestampJsonConverter()
      required final DateTime updatedAt}) = _$MatchIdModelImpl;

  factory _MatchIdModel.fromJson(Map<String, dynamic> json) =
      _$MatchIdModelImpl.fromJson;

  @override
  List<String> get matchIds;
  @override
  @RequiredFirestoreTimestampJsonConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MatchIdModelImplCopyWith<_$MatchIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
