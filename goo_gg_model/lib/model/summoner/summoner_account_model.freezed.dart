// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summoner_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SummonerAccountModel _$SummonerAccountModelFromJson(Map<String, dynamic> json) {
  return _SummonerAccountModel.fromJson(json);
}

/// @nodoc
mixin _$SummonerAccountModel {
  String get id => throw _privateConstructorUsedError;
  String get puuid => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get profileIconId => throw _privateConstructorUsedError;
  double get summonerLevel => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  DateTime get revisionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummonerAccountModelCopyWith<SummonerAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummonerAccountModelCopyWith<$Res> {
  factory $SummonerAccountModelCopyWith(SummonerAccountModel value,
          $Res Function(SummonerAccountModel) then) =
      _$SummonerAccountModelCopyWithImpl<$Res, SummonerAccountModel>;
  @useResult
  $Res call(
      {String id,
      String puuid,
      String accountId,
      String name,
      int profileIconId,
      double summonerLevel,
      @EpochDateTimeConverter() DateTime revisionDate});
}

/// @nodoc
class _$SummonerAccountModelCopyWithImpl<$Res,
        $Val extends SummonerAccountModel>
    implements $SummonerAccountModelCopyWith<$Res> {
  _$SummonerAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? puuid = null,
    Object? accountId = null,
    Object? name = null,
    Object? profileIconId = null,
    Object? summonerLevel = null,
    Object? revisionDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      puuid: null == puuid
          ? _value.puuid
          : puuid // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileIconId: null == profileIconId
          ? _value.profileIconId
          : profileIconId // ignore: cast_nullable_to_non_nullable
              as int,
      summonerLevel: null == summonerLevel
          ? _value.summonerLevel
          : summonerLevel // ignore: cast_nullable_to_non_nullable
              as double,
      revisionDate: null == revisionDate
          ? _value.revisionDate
          : revisionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummonerAccountModelImplCopyWith<$Res>
    implements $SummonerAccountModelCopyWith<$Res> {
  factory _$$SummonerAccountModelImplCopyWith(_$SummonerAccountModelImpl value,
          $Res Function(_$SummonerAccountModelImpl) then) =
      __$$SummonerAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String puuid,
      String accountId,
      String name,
      int profileIconId,
      double summonerLevel,
      @EpochDateTimeConverter() DateTime revisionDate});
}

/// @nodoc
class __$$SummonerAccountModelImplCopyWithImpl<$Res>
    extends _$SummonerAccountModelCopyWithImpl<$Res, _$SummonerAccountModelImpl>
    implements _$$SummonerAccountModelImplCopyWith<$Res> {
  __$$SummonerAccountModelImplCopyWithImpl(_$SummonerAccountModelImpl _value,
      $Res Function(_$SummonerAccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? puuid = null,
    Object? accountId = null,
    Object? name = null,
    Object? profileIconId = null,
    Object? summonerLevel = null,
    Object? revisionDate = null,
  }) {
    return _then(_$SummonerAccountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      puuid: null == puuid
          ? _value.puuid
          : puuid // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileIconId: null == profileIconId
          ? _value.profileIconId
          : profileIconId // ignore: cast_nullable_to_non_nullable
              as int,
      summonerLevel: null == summonerLevel
          ? _value.summonerLevel
          : summonerLevel // ignore: cast_nullable_to_non_nullable
              as double,
      revisionDate: null == revisionDate
          ? _value.revisionDate
          : revisionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummonerAccountModelImpl implements _SummonerAccountModel {
  _$SummonerAccountModelImpl(
      {required this.id,
      required this.puuid,
      required this.accountId,
      required this.name,
      required this.profileIconId,
      required this.summonerLevel,
      @EpochDateTimeConverter() required this.revisionDate});

  factory _$SummonerAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummonerAccountModelImplFromJson(json);

  @override
  final String id;
  @override
  final String puuid;
  @override
  final String accountId;
  @override
  final String name;
  @override
  final int profileIconId;
  @override
  final double summonerLevel;
  @override
  @EpochDateTimeConverter()
  final DateTime revisionDate;

  @override
  String toString() {
    return 'SummonerAccountModel(id: $id, puuid: $puuid, accountId: $accountId, name: $name, profileIconId: $profileIconId, summonerLevel: $summonerLevel, revisionDate: $revisionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummonerAccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.puuid, puuid) || other.puuid == puuid) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileIconId, profileIconId) ||
                other.profileIconId == profileIconId) &&
            (identical(other.summonerLevel, summonerLevel) ||
                other.summonerLevel == summonerLevel) &&
            (identical(other.revisionDate, revisionDate) ||
                other.revisionDate == revisionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, puuid, accountId, name,
      profileIconId, summonerLevel, revisionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummonerAccountModelImplCopyWith<_$SummonerAccountModelImpl>
      get copyWith =>
          __$$SummonerAccountModelImplCopyWithImpl<_$SummonerAccountModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummonerAccountModelImplToJson(
      this,
    );
  }
}

abstract class _SummonerAccountModel implements SummonerAccountModel {
  factory _SummonerAccountModel(
          {required final String id,
          required final String puuid,
          required final String accountId,
          required final String name,
          required final int profileIconId,
          required final double summonerLevel,
          @EpochDateTimeConverter() required final DateTime revisionDate}) =
      _$SummonerAccountModelImpl;

  factory _SummonerAccountModel.fromJson(Map<String, dynamic> json) =
      _$SummonerAccountModelImpl.fromJson;

  @override
  String get id;
  @override
  String get puuid;
  @override
  String get accountId;
  @override
  String get name;
  @override
  int get profileIconId;
  @override
  double get summonerLevel;
  @override
  @EpochDateTimeConverter()
  DateTime get revisionDate;
  @override
  @JsonKey(ignore: true)
  _$$SummonerAccountModelImplCopyWith<_$SummonerAccountModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
