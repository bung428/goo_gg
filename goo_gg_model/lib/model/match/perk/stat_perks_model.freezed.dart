// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_perks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatPerksModel _$StatPerksModelFromJson(Map<String, dynamic> json) {
  return _StatPerksModel.fromJson(json);
}

/// @nodoc
mixin _$StatPerksModel {
  int get defense => throw _privateConstructorUsedError;
  int get flex => throw _privateConstructorUsedError;
  int get offense => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatPerksModelCopyWith<StatPerksModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatPerksModelCopyWith<$Res> {
  factory $StatPerksModelCopyWith(
          StatPerksModel value, $Res Function(StatPerksModel) then) =
      _$StatPerksModelCopyWithImpl<$Res, StatPerksModel>;
  @useResult
  $Res call({int defense, int flex, int offense});
}

/// @nodoc
class _$StatPerksModelCopyWithImpl<$Res, $Val extends StatPerksModel>
    implements $StatPerksModelCopyWith<$Res> {
  _$StatPerksModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defense = null,
    Object? flex = null,
    Object? offense = null,
  }) {
    return _then(_value.copyWith(
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      flex: null == flex
          ? _value.flex
          : flex // ignore: cast_nullable_to_non_nullable
              as int,
      offense: null == offense
          ? _value.offense
          : offense // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatPerksModelImplCopyWith<$Res>
    implements $StatPerksModelCopyWith<$Res> {
  factory _$$StatPerksModelImplCopyWith(_$StatPerksModelImpl value,
          $Res Function(_$StatPerksModelImpl) then) =
      __$$StatPerksModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int defense, int flex, int offense});
}

/// @nodoc
class __$$StatPerksModelImplCopyWithImpl<$Res>
    extends _$StatPerksModelCopyWithImpl<$Res, _$StatPerksModelImpl>
    implements _$$StatPerksModelImplCopyWith<$Res> {
  __$$StatPerksModelImplCopyWithImpl(
      _$StatPerksModelImpl _value, $Res Function(_$StatPerksModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defense = null,
    Object? flex = null,
    Object? offense = null,
  }) {
    return _then(_$StatPerksModelImpl(
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      flex: null == flex
          ? _value.flex
          : flex // ignore: cast_nullable_to_non_nullable
              as int,
      offense: null == offense
          ? _value.offense
          : offense // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatPerksModelImpl implements _StatPerksModel {
  _$StatPerksModelImpl(
      {required this.defense, required this.flex, required this.offense});

  factory _$StatPerksModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatPerksModelImplFromJson(json);

  @override
  final int defense;
  @override
  final int flex;
  @override
  final int offense;

  @override
  String toString() {
    return 'StatPerksModel(defense: $defense, flex: $flex, offense: $offense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatPerksModelImpl &&
            (identical(other.defense, defense) || other.defense == defense) &&
            (identical(other.flex, flex) || other.flex == flex) &&
            (identical(other.offense, offense) || other.offense == offense));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, defense, flex, offense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatPerksModelImplCopyWith<_$StatPerksModelImpl> get copyWith =>
      __$$StatPerksModelImplCopyWithImpl<_$StatPerksModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatPerksModelImplToJson(
      this,
    );
  }
}

abstract class _StatPerksModel implements StatPerksModel {
  factory _StatPerksModel(
      {required final int defense,
      required final int flex,
      required final int offense}) = _$StatPerksModelImpl;

  factory _StatPerksModel.fromJson(Map<String, dynamic> json) =
      _$StatPerksModelImpl.fromJson;

  @override
  int get defense;
  @override
  int get flex;
  @override
  int get offense;
  @override
  @JsonKey(ignore: true)
  _$$StatPerksModelImplCopyWith<_$StatPerksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
