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
  double get gameId => throw _privateConstructorUsedError;
  int get queueId => throw _privateConstructorUsedError;
  int get mapId => throw _privateConstructorUsedError;
  String get gameMode => throw _privateConstructorUsedError;
  String get gameName => throw _privateConstructorUsedError;
  String get gameType => throw _privateConstructorUsedError;
  String get gameVersion => throw _privateConstructorUsedError;
  String get tournamentCode => throw _privateConstructorUsedError;
  int get gameDuration => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  DateTime get gameCreation => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  DateTime get gameEndTimestamp => throw _privateConstructorUsedError;
  @EpochDateTimeConverter()
  DateTime get gameStartTimestamp => throw _privateConstructorUsedError;
  List<ParticipantModel> get participants => throw _privateConstructorUsedError;
  List<TeamRecordModel> get teams => throw _privateConstructorUsedError;

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
  $Res call(
      {double gameId,
      int queueId,
      int mapId,
      String gameMode,
      String gameName,
      String gameType,
      String gameVersion,
      String tournamentCode,
      int gameDuration,
      @EpochDateTimeConverter() DateTime gameCreation,
      @EpochDateTimeConverter() DateTime gameEndTimestamp,
      @EpochDateTimeConverter() DateTime gameStartTimestamp,
      List<ParticipantModel> participants,
      List<TeamRecordModel> teams});
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
    Object? gameId = null,
    Object? queueId = null,
    Object? mapId = null,
    Object? gameMode = null,
    Object? gameName = null,
    Object? gameType = null,
    Object? gameVersion = null,
    Object? tournamentCode = null,
    Object? gameDuration = null,
    Object? gameCreation = null,
    Object? gameEndTimestamp = null,
    Object? gameStartTimestamp = null,
    Object? participants = null,
    Object? teams = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as double,
      queueId: null == queueId
          ? _value.queueId
          : queueId // ignore: cast_nullable_to_non_nullable
              as int,
      mapId: null == mapId
          ? _value.mapId
          : mapId // ignore: cast_nullable_to_non_nullable
              as int,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      gameVersion: null == gameVersion
          ? _value.gameVersion
          : gameVersion // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentCode: null == tournamentCode
          ? _value.tournamentCode
          : tournamentCode // ignore: cast_nullable_to_non_nullable
              as String,
      gameDuration: null == gameDuration
          ? _value.gameDuration
          : gameDuration // ignore: cast_nullable_to_non_nullable
              as int,
      gameCreation: null == gameCreation
          ? _value.gameCreation
          : gameCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameEndTimestamp: null == gameEndTimestamp
          ? _value.gameEndTimestamp
          : gameEndTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameStartTimestamp: null == gameStartTimestamp
          ? _value.gameStartTimestamp
          : gameStartTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ParticipantModel>,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamRecordModel>,
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
  $Res call(
      {double gameId,
      int queueId,
      int mapId,
      String gameMode,
      String gameName,
      String gameType,
      String gameVersion,
      String tournamentCode,
      int gameDuration,
      @EpochDateTimeConverter() DateTime gameCreation,
      @EpochDateTimeConverter() DateTime gameEndTimestamp,
      @EpochDateTimeConverter() DateTime gameStartTimestamp,
      List<ParticipantModel> participants,
      List<TeamRecordModel> teams});
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
    Object? gameId = null,
    Object? queueId = null,
    Object? mapId = null,
    Object? gameMode = null,
    Object? gameName = null,
    Object? gameType = null,
    Object? gameVersion = null,
    Object? tournamentCode = null,
    Object? gameDuration = null,
    Object? gameCreation = null,
    Object? gameEndTimestamp = null,
    Object? gameStartTimestamp = null,
    Object? participants = null,
    Object? teams = null,
  }) {
    return _then(_$MatchInfoModelImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as double,
      queueId: null == queueId
          ? _value.queueId
          : queueId // ignore: cast_nullable_to_non_nullable
              as int,
      mapId: null == mapId
          ? _value.mapId
          : mapId // ignore: cast_nullable_to_non_nullable
              as int,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      gameVersion: null == gameVersion
          ? _value.gameVersion
          : gameVersion // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentCode: null == tournamentCode
          ? _value.tournamentCode
          : tournamentCode // ignore: cast_nullable_to_non_nullable
              as String,
      gameDuration: null == gameDuration
          ? _value.gameDuration
          : gameDuration // ignore: cast_nullable_to_non_nullable
              as int,
      gameCreation: null == gameCreation
          ? _value.gameCreation
          : gameCreation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameEndTimestamp: null == gameEndTimestamp
          ? _value.gameEndTimestamp
          : gameEndTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameStartTimestamp: null == gameStartTimestamp
          ? _value.gameStartTimestamp
          : gameStartTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ParticipantModel>,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamRecordModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchInfoModelImpl implements _MatchInfoModel {
  _$MatchInfoModelImpl(
      {required this.gameId,
      required this.queueId,
      required this.mapId,
      required this.gameMode,
      required this.gameName,
      required this.gameType,
      required this.gameVersion,
      required this.tournamentCode,
      required this.gameDuration,
      @EpochDateTimeConverter() required this.gameCreation,
      @EpochDateTimeConverter() required this.gameEndTimestamp,
      @EpochDateTimeConverter() required this.gameStartTimestamp,
      required final List<ParticipantModel> participants,
      required final List<TeamRecordModel> teams})
      : _participants = participants,
        _teams = teams;

  factory _$MatchInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchInfoModelImplFromJson(json);

  @override
  final double gameId;
  @override
  final int queueId;
  @override
  final int mapId;
  @override
  final String gameMode;
  @override
  final String gameName;
  @override
  final String gameType;
  @override
  final String gameVersion;
  @override
  final String tournamentCode;
  @override
  final int gameDuration;
  @override
  @EpochDateTimeConverter()
  final DateTime gameCreation;
  @override
  @EpochDateTimeConverter()
  final DateTime gameEndTimestamp;
  @override
  @EpochDateTimeConverter()
  final DateTime gameStartTimestamp;
  final List<ParticipantModel> _participants;
  @override
  List<ParticipantModel> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<TeamRecordModel> _teams;
  @override
  List<TeamRecordModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  String toString() {
    return 'MatchInfoModel(gameId: $gameId, queueId: $queueId, mapId: $mapId, gameMode: $gameMode, gameName: $gameName, gameType: $gameType, gameVersion: $gameVersion, tournamentCode: $tournamentCode, gameDuration: $gameDuration, gameCreation: $gameCreation, gameEndTimestamp: $gameEndTimestamp, gameStartTimestamp: $gameStartTimestamp, participants: $participants, teams: $teams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchInfoModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.queueId, queueId) || other.queueId == queueId) &&
            (identical(other.mapId, mapId) || other.mapId == mapId) &&
            (identical(other.gameMode, gameMode) ||
                other.gameMode == gameMode) &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.gameVersion, gameVersion) ||
                other.gameVersion == gameVersion) &&
            (identical(other.tournamentCode, tournamentCode) ||
                other.tournamentCode == tournamentCode) &&
            (identical(other.gameDuration, gameDuration) ||
                other.gameDuration == gameDuration) &&
            (identical(other.gameCreation, gameCreation) ||
                other.gameCreation == gameCreation) &&
            (identical(other.gameEndTimestamp, gameEndTimestamp) ||
                other.gameEndTimestamp == gameEndTimestamp) &&
            (identical(other.gameStartTimestamp, gameStartTimestamp) ||
                other.gameStartTimestamp == gameStartTimestamp) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameId,
      queueId,
      mapId,
      gameMode,
      gameName,
      gameType,
      gameVersion,
      tournamentCode,
      gameDuration,
      gameCreation,
      gameEndTimestamp,
      gameStartTimestamp,
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_teams));

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
  factory _MatchInfoModel(
      {required final double gameId,
      required final int queueId,
      required final int mapId,
      required final String gameMode,
      required final String gameName,
      required final String gameType,
      required final String gameVersion,
      required final String tournamentCode,
      required final int gameDuration,
      @EpochDateTimeConverter() required final DateTime gameCreation,
      @EpochDateTimeConverter() required final DateTime gameEndTimestamp,
      @EpochDateTimeConverter() required final DateTime gameStartTimestamp,
      required final List<ParticipantModel> participants,
      required final List<TeamRecordModel> teams}) = _$MatchInfoModelImpl;

  factory _MatchInfoModel.fromJson(Map<String, dynamic> json) =
      _$MatchInfoModelImpl.fromJson;

  @override
  double get gameId;
  @override
  int get queueId;
  @override
  int get mapId;
  @override
  String get gameMode;
  @override
  String get gameName;
  @override
  String get gameType;
  @override
  String get gameVersion;
  @override
  String get tournamentCode;
  @override
  int get gameDuration;
  @override
  @EpochDateTimeConverter()
  DateTime get gameCreation;
  @override
  @EpochDateTimeConverter()
  DateTime get gameEndTimestamp;
  @override
  @EpochDateTimeConverter()
  DateTime get gameStartTimestamp;
  @override
  List<ParticipantModel> get participants;
  @override
  List<TeamRecordModel> get teams;
  @override
  @JsonKey(ignore: true)
  _$$MatchInfoModelImplCopyWith<_$MatchInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
