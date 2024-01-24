// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MetaDataModel _$MetaDataModelFromJson(Map<String, dynamic> json) {
  return _MetaDataModel.fromJson(json);
}

/// @nodoc
mixin _$MetaDataModel {
  String get dataVersion => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDataModelCopyWith<MetaDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataModelCopyWith<$Res> {
  factory $MetaDataModelCopyWith(
          MetaDataModel value, $Res Function(MetaDataModel) then) =
      _$MetaDataModelCopyWithImpl<$Res, MetaDataModel>;
  @useResult
  $Res call({String dataVersion, String matchId, List<String> participants});
}

/// @nodoc
class _$MetaDataModelCopyWithImpl<$Res, $Val extends MetaDataModel>
    implements $MetaDataModelCopyWith<$Res> {
  _$MetaDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataVersion = null,
    Object? matchId = null,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      dataVersion: null == dataVersion
          ? _value.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataModelImplCopyWith<$Res>
    implements $MetaDataModelCopyWith<$Res> {
  factory _$$MetaDataModelImplCopyWith(
          _$MetaDataModelImpl value, $Res Function(_$MetaDataModelImpl) then) =
      __$$MetaDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dataVersion, String matchId, List<String> participants});
}

/// @nodoc
class __$$MetaDataModelImplCopyWithImpl<$Res>
    extends _$MetaDataModelCopyWithImpl<$Res, _$MetaDataModelImpl>
    implements _$$MetaDataModelImplCopyWith<$Res> {
  __$$MetaDataModelImplCopyWithImpl(
      _$MetaDataModelImpl _value, $Res Function(_$MetaDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataVersion = null,
    Object? matchId = null,
    Object? participants = null,
  }) {
    return _then(_$MetaDataModelImpl(
      dataVersion: null == dataVersion
          ? _value.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataModelImpl implements _MetaDataModel {
  _$MetaDataModelImpl(
      {required this.dataVersion,
      required this.matchId,
      required final List<String> participants})
      : _participants = participants;

  factory _$MetaDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataModelImplFromJson(json);

  @override
  final String dataVersion;
  @override
  final String matchId;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'MetaDataModel(dataVersion: $dataVersion, matchId: $matchId, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataModelImpl &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dataVersion, matchId,
      const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataModelImplCopyWith<_$MetaDataModelImpl> get copyWith =>
      __$$MetaDataModelImplCopyWithImpl<_$MetaDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataModelImplToJson(
      this,
    );
  }
}

abstract class _MetaDataModel implements MetaDataModel {
  factory _MetaDataModel(
      {required final String dataVersion,
      required final String matchId,
      required final List<String> participants}) = _$MetaDataModelImpl;

  factory _MetaDataModel.fromJson(Map<String, dynamic> json) =
      _$MetaDataModelImpl.fromJson;

  @override
  String get dataVersion;
  @override
  String get matchId;
  @override
  List<String> get participants;
  @override
  @JsonKey(ignore: true)
  _$$MetaDataModelImplCopyWith<_$MetaDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
