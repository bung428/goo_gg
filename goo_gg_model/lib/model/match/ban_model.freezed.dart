// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ban_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BanModel _$BanModelFromJson(Map<String, dynamic> json) {
  return _BanModel.fromJson(json);
}

/// @nodoc
mixin _$BanModel {
  bool? get first => throw _privateConstructorUsedError;
  int? get kills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BanModelCopyWith<BanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BanModelCopyWith<$Res> {
  factory $BanModelCopyWith(BanModel value, $Res Function(BanModel) then) =
      _$BanModelCopyWithImpl<$Res, BanModel>;
  @useResult
  $Res call({bool? first, int? kills});
}

/// @nodoc
class _$BanModelCopyWithImpl<$Res, $Val extends BanModel>
    implements $BanModelCopyWith<$Res> {
  _$BanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? kills = freezed,
  }) {
    return _then(_value.copyWith(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      kills: freezed == kills
          ? _value.kills
          : kills // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BanModelImplCopyWith<$Res>
    implements $BanModelCopyWith<$Res> {
  factory _$$BanModelImplCopyWith(
          _$BanModelImpl value, $Res Function(_$BanModelImpl) then) =
      __$$BanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? first, int? kills});
}

/// @nodoc
class __$$BanModelImplCopyWithImpl<$Res>
    extends _$BanModelCopyWithImpl<$Res, _$BanModelImpl>
    implements _$$BanModelImplCopyWith<$Res> {
  __$$BanModelImplCopyWithImpl(
      _$BanModelImpl _value, $Res Function(_$BanModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? kills = freezed,
  }) {
    return _then(_$BanModelImpl(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      kills: freezed == kills
          ? _value.kills
          : kills // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BanModelImpl implements _BanModel {
  _$BanModelImpl({this.first, this.kills});

  factory _$BanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BanModelImplFromJson(json);

  @override
  final bool? first;
  @override
  final int? kills;

  @override
  String toString() {
    return 'BanModel(first: $first, kills: $kills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BanModelImpl &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.kills, kills) || other.kills == kills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, kills);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BanModelImplCopyWith<_$BanModelImpl> get copyWith =>
      __$$BanModelImplCopyWithImpl<_$BanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BanModelImplToJson(
      this,
    );
  }
}

abstract class _BanModel implements BanModel {
  factory _BanModel({final bool? first, final int? kills}) = _$BanModelImpl;

  factory _BanModel.fromJson(Map<String, dynamic> json) =
      _$BanModelImpl.fromJson;

  @override
  bool? get first;
  @override
  int? get kills;
  @override
  @JsonKey(ignore: true)
  _$$BanModelImplCopyWith<_$BanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
