// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamRecordModel _$TeamRecordModelFromJson(Map<String, dynamic> json) {
  return _TeamRecordModel.fromJson(json);
}

/// @nodoc
mixin _$TeamRecordModel {
  List<BanModel>? get bans => throw _privateConstructorUsedError;
  GameObjectRecordModel get objectives => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  bool get win => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamRecordModelCopyWith<TeamRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamRecordModelCopyWith<$Res> {
  factory $TeamRecordModelCopyWith(
          TeamRecordModel value, $Res Function(TeamRecordModel) then) =
      _$TeamRecordModelCopyWithImpl<$Res, TeamRecordModel>;
  @useResult
  $Res call(
      {List<BanModel>? bans,
      GameObjectRecordModel objectives,
      int teamId,
      bool win});

  $GameObjectRecordModelCopyWith<$Res> get objectives;
}

/// @nodoc
class _$TeamRecordModelCopyWithImpl<$Res, $Val extends TeamRecordModel>
    implements $TeamRecordModelCopyWith<$Res> {
  _$TeamRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bans = freezed,
    Object? objectives = null,
    Object? teamId = null,
    Object? win = null,
  }) {
    return _then(_value.copyWith(
      bans: freezed == bans
          ? _value.bans
          : bans // ignore: cast_nullable_to_non_nullable
              as List<BanModel>?,
      objectives: null == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as GameObjectRecordModel,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameObjectRecordModelCopyWith<$Res> get objectives {
    return $GameObjectRecordModelCopyWith<$Res>(_value.objectives, (value) {
      return _then(_value.copyWith(objectives: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamRecordModelImplCopyWith<$Res>
    implements $TeamRecordModelCopyWith<$Res> {
  factory _$$TeamRecordModelImplCopyWith(_$TeamRecordModelImpl value,
          $Res Function(_$TeamRecordModelImpl) then) =
      __$$TeamRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BanModel>? bans,
      GameObjectRecordModel objectives,
      int teamId,
      bool win});

  @override
  $GameObjectRecordModelCopyWith<$Res> get objectives;
}

/// @nodoc
class __$$TeamRecordModelImplCopyWithImpl<$Res>
    extends _$TeamRecordModelCopyWithImpl<$Res, _$TeamRecordModelImpl>
    implements _$$TeamRecordModelImplCopyWith<$Res> {
  __$$TeamRecordModelImplCopyWithImpl(
      _$TeamRecordModelImpl _value, $Res Function(_$TeamRecordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bans = freezed,
    Object? objectives = null,
    Object? teamId = null,
    Object? win = null,
  }) {
    return _then(_$TeamRecordModelImpl(
      bans: freezed == bans
          ? _value._bans
          : bans // ignore: cast_nullable_to_non_nullable
              as List<BanModel>?,
      objectives: null == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as GameObjectRecordModel,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamRecordModelImpl implements _TeamRecordModel {
  _$TeamRecordModelImpl(
      {final List<BanModel>? bans,
      required this.objectives,
      required this.teamId,
      required this.win})
      : _bans = bans;

  factory _$TeamRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamRecordModelImplFromJson(json);

  final List<BanModel>? _bans;
  @override
  List<BanModel>? get bans {
    final value = _bans;
    if (value == null) return null;
    if (_bans is EqualUnmodifiableListView) return _bans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final GameObjectRecordModel objectives;
  @override
  final int teamId;
  @override
  final bool win;

  @override
  String toString() {
    return 'TeamRecordModel(bans: $bans, objectives: $objectives, teamId: $teamId, win: $win)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamRecordModelImpl &&
            const DeepCollectionEquality().equals(other._bans, _bans) &&
            (identical(other.objectives, objectives) ||
                other.objectives == objectives) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.win, win) || other.win == win));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bans), objectives, teamId, win);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamRecordModelImplCopyWith<_$TeamRecordModelImpl> get copyWith =>
      __$$TeamRecordModelImplCopyWithImpl<_$TeamRecordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamRecordModelImplToJson(
      this,
    );
  }
}

abstract class _TeamRecordModel implements TeamRecordModel {
  factory _TeamRecordModel(
      {final List<BanModel>? bans,
      required final GameObjectRecordModel objectives,
      required final int teamId,
      required final bool win}) = _$TeamRecordModelImpl;

  factory _TeamRecordModel.fromJson(Map<String, dynamic> json) =
      _$TeamRecordModelImpl.fromJson;

  @override
  List<BanModel>? get bans;
  @override
  GameObjectRecordModel get objectives;
  @override
  int get teamId;
  @override
  bool get win;
  @override
  @JsonKey(ignore: true)
  _$$TeamRecordModelImplCopyWith<_$TeamRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
