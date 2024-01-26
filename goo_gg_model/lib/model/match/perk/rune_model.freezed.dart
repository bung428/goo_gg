// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rune_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RuneModel _$RuneModelFromJson(Map<String, dynamic> json) {
  return _RuneModel.fromJson(json);
}

/// @nodoc
mixin _$RuneModel {
  StatPerksModel get statPerks => throw _privateConstructorUsedError;
  List<PerkStyleModel> get styles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuneModelCopyWith<RuneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuneModelCopyWith<$Res> {
  factory $RuneModelCopyWith(RuneModel value, $Res Function(RuneModel) then) =
      _$RuneModelCopyWithImpl<$Res, RuneModel>;
  @useResult
  $Res call({StatPerksModel statPerks, List<PerkStyleModel> styles});

  $StatPerksModelCopyWith<$Res> get statPerks;
}

/// @nodoc
class _$RuneModelCopyWithImpl<$Res, $Val extends RuneModel>
    implements $RuneModelCopyWith<$Res> {
  _$RuneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statPerks = null,
    Object? styles = null,
  }) {
    return _then(_value.copyWith(
      statPerks: null == statPerks
          ? _value.statPerks
          : statPerks // ignore: cast_nullable_to_non_nullable
              as StatPerksModel,
      styles: null == styles
          ? _value.styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<PerkStyleModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatPerksModelCopyWith<$Res> get statPerks {
    return $StatPerksModelCopyWith<$Res>(_value.statPerks, (value) {
      return _then(_value.copyWith(statPerks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RuneModelImplCopyWith<$Res>
    implements $RuneModelCopyWith<$Res> {
  factory _$$RuneModelImplCopyWith(
          _$RuneModelImpl value, $Res Function(_$RuneModelImpl) then) =
      __$$RuneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StatPerksModel statPerks, List<PerkStyleModel> styles});

  @override
  $StatPerksModelCopyWith<$Res> get statPerks;
}

/// @nodoc
class __$$RuneModelImplCopyWithImpl<$Res>
    extends _$RuneModelCopyWithImpl<$Res, _$RuneModelImpl>
    implements _$$RuneModelImplCopyWith<$Res> {
  __$$RuneModelImplCopyWithImpl(
      _$RuneModelImpl _value, $Res Function(_$RuneModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statPerks = null,
    Object? styles = null,
  }) {
    return _then(_$RuneModelImpl(
      statPerks: null == statPerks
          ? _value.statPerks
          : statPerks // ignore: cast_nullable_to_non_nullable
              as StatPerksModel,
      styles: null == styles
          ? _value._styles
          : styles // ignore: cast_nullable_to_non_nullable
              as List<PerkStyleModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RuneModelImpl implements _RuneModel {
  _$RuneModelImpl(
      {required this.statPerks, required final List<PerkStyleModel> styles})
      : _styles = styles;

  factory _$RuneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuneModelImplFromJson(json);

  @override
  final StatPerksModel statPerks;
  final List<PerkStyleModel> _styles;
  @override
  List<PerkStyleModel> get styles {
    if (_styles is EqualUnmodifiableListView) return _styles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_styles);
  }

  @override
  String toString() {
    return 'RuneModel(statPerks: $statPerks, styles: $styles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuneModelImpl &&
            (identical(other.statPerks, statPerks) ||
                other.statPerks == statPerks) &&
            const DeepCollectionEquality().equals(other._styles, _styles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, statPerks, const DeepCollectionEquality().hash(_styles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RuneModelImplCopyWith<_$RuneModelImpl> get copyWith =>
      __$$RuneModelImplCopyWithImpl<_$RuneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuneModelImplToJson(
      this,
    );
  }
}

abstract class _RuneModel implements RuneModel {
  factory _RuneModel(
      {required final StatPerksModel statPerks,
      required final List<PerkStyleModel> styles}) = _$RuneModelImpl;

  factory _RuneModel.fromJson(Map<String, dynamic> json) =
      _$RuneModelImpl.fromJson;

  @override
  StatPerksModel get statPerks;
  @override
  List<PerkStyleModel> get styles;
  @override
  @JsonKey(ignore: true)
  _$$RuneModelImplCopyWith<_$RuneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
