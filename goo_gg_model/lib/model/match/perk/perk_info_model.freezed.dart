// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'perk_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PerkInfoModel _$PerkInfoModelFromJson(Map<String, dynamic> json) {
  return _PerkInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PerkInfoModel {
  int get perk => throw _privateConstructorUsedError;
  int get var1 => throw _privateConstructorUsedError;
  int get var2 => throw _privateConstructorUsedError;
  int get var3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerkInfoModelCopyWith<PerkInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerkInfoModelCopyWith<$Res> {
  factory $PerkInfoModelCopyWith(
          PerkInfoModel value, $Res Function(PerkInfoModel) then) =
      _$PerkInfoModelCopyWithImpl<$Res, PerkInfoModel>;
  @useResult
  $Res call({int perk, int var1, int var2, int var3});
}

/// @nodoc
class _$PerkInfoModelCopyWithImpl<$Res, $Val extends PerkInfoModel>
    implements $PerkInfoModelCopyWith<$Res> {
  _$PerkInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perk = null,
    Object? var1 = null,
    Object? var2 = null,
    Object? var3 = null,
  }) {
    return _then(_value.copyWith(
      perk: null == perk
          ? _value.perk
          : perk // ignore: cast_nullable_to_non_nullable
              as int,
      var1: null == var1
          ? _value.var1
          : var1 // ignore: cast_nullable_to_non_nullable
              as int,
      var2: null == var2
          ? _value.var2
          : var2 // ignore: cast_nullable_to_non_nullable
              as int,
      var3: null == var3
          ? _value.var3
          : var3 // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerkInfoModelImplCopyWith<$Res>
    implements $PerkInfoModelCopyWith<$Res> {
  factory _$$PerkInfoModelImplCopyWith(
          _$PerkInfoModelImpl value, $Res Function(_$PerkInfoModelImpl) then) =
      __$$PerkInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int perk, int var1, int var2, int var3});
}

/// @nodoc
class __$$PerkInfoModelImplCopyWithImpl<$Res>
    extends _$PerkInfoModelCopyWithImpl<$Res, _$PerkInfoModelImpl>
    implements _$$PerkInfoModelImplCopyWith<$Res> {
  __$$PerkInfoModelImplCopyWithImpl(
      _$PerkInfoModelImpl _value, $Res Function(_$PerkInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perk = null,
    Object? var1 = null,
    Object? var2 = null,
    Object? var3 = null,
  }) {
    return _then(_$PerkInfoModelImpl(
      perk: null == perk
          ? _value.perk
          : perk // ignore: cast_nullable_to_non_nullable
              as int,
      var1: null == var1
          ? _value.var1
          : var1 // ignore: cast_nullable_to_non_nullable
              as int,
      var2: null == var2
          ? _value.var2
          : var2 // ignore: cast_nullable_to_non_nullable
              as int,
      var3: null == var3
          ? _value.var3
          : var3 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerkInfoModelImpl implements _PerkInfoModel {
  _$PerkInfoModelImpl(
      {required this.perk,
      required this.var1,
      required this.var2,
      required this.var3});

  factory _$PerkInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerkInfoModelImplFromJson(json);

  @override
  final int perk;
  @override
  final int var1;
  @override
  final int var2;
  @override
  final int var3;

  @override
  String toString() {
    return 'PerkInfoModel(perk: $perk, var1: $var1, var2: $var2, var3: $var3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerkInfoModelImpl &&
            (identical(other.perk, perk) || other.perk == perk) &&
            (identical(other.var1, var1) || other.var1 == var1) &&
            (identical(other.var2, var2) || other.var2 == var2) &&
            (identical(other.var3, var3) || other.var3 == var3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perk, var1, var2, var3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerkInfoModelImplCopyWith<_$PerkInfoModelImpl> get copyWith =>
      __$$PerkInfoModelImplCopyWithImpl<_$PerkInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerkInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PerkInfoModel implements PerkInfoModel {
  factory _PerkInfoModel(
      {required final int perk,
      required final int var1,
      required final int var2,
      required final int var3}) = _$PerkInfoModelImpl;

  factory _PerkInfoModel.fromJson(Map<String, dynamic> json) =
      _$PerkInfoModelImpl.fromJson;

  @override
  int get perk;
  @override
  int get var1;
  @override
  int get var2;
  @override
  int get var3;
  @override
  @JsonKey(ignore: true)
  _$$PerkInfoModelImplCopyWith<_$PerkInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
