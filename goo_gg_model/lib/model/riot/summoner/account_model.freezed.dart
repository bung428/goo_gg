// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  String get puuid => throw _privateConstructorUsedError;
  String get gameName => throw _privateConstructorUsedError;
  String get tagLine => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res, AccountModel>;
  @useResult
  $Res call({String puuid, String gameName, String tagLine});
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res, $Val extends AccountModel>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puuid = null,
    Object? gameName = null,
    Object? tagLine = null,
  }) {
    return _then(_value.copyWith(
      puuid: null == puuid
          ? _value.puuid
          : puuid // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      tagLine: null == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountModelImplCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$AccountModelImplCopyWith(
          _$AccountModelImpl value, $Res Function(_$AccountModelImpl) then) =
      __$$AccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String puuid, String gameName, String tagLine});
}

/// @nodoc
class __$$AccountModelImplCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res, _$AccountModelImpl>
    implements _$$AccountModelImplCopyWith<$Res> {
  __$$AccountModelImplCopyWithImpl(
      _$AccountModelImpl _value, $Res Function(_$AccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puuid = null,
    Object? gameName = null,
    Object? tagLine = null,
  }) {
    return _then(_$AccountModelImpl(
      puuid: null == puuid
          ? _value.puuid
          : puuid // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      tagLine: null == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountModelImpl implements _AccountModel {
  _$AccountModelImpl(
      {required this.puuid, required this.gameName, required this.tagLine});

  factory _$AccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountModelImplFromJson(json);

  @override
  final String puuid;
  @override
  final String gameName;
  @override
  final String tagLine;

  @override
  String toString() {
    return 'AccountModel(puuid: $puuid, gameName: $gameName, tagLine: $tagLine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountModelImpl &&
            (identical(other.puuid, puuid) || other.puuid == puuid) &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.tagLine, tagLine) || other.tagLine == tagLine));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, puuid, gameName, tagLine);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      __$$AccountModelImplCopyWithImpl<_$AccountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountModelImplToJson(
      this,
    );
  }
}

abstract class _AccountModel implements AccountModel {
  factory _AccountModel(
      {required final String puuid,
      required final String gameName,
      required final String tagLine}) = _$AccountModelImpl;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$AccountModelImpl.fromJson;

  @override
  String get puuid;
  @override
  String get gameName;
  @override
  String get tagLine;
  @override
  @JsonKey(ignore: true)
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
