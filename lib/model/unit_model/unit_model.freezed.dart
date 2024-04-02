// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) {
  return _UnitModel.fromJson(json);
}

/// @nodoc
mixin _$UnitModel {
  String get uid => throw _privateConstructorUsedError;
  String get ten_don_vi => throw _privateConstructorUsedError;
  String get ky_hieu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitModelCopyWith<UnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitModelCopyWith<$Res> {
  factory $UnitModelCopyWith(UnitModel value, $Res Function(UnitModel) then) =
      _$UnitModelCopyWithImpl<$Res, UnitModel>;
  @useResult
  $Res call({String uid, String ten_don_vi, String ky_hieu});
}

/// @nodoc
class _$UnitModelCopyWithImpl<$Res, $Val extends UnitModel>
    implements $UnitModelCopyWith<$Res> {
  _$UnitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? ten_don_vi = null,
    Object? ky_hieu = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ten_don_vi: null == ten_don_vi
          ? _value.ten_don_vi
          : ten_don_vi // ignore: cast_nullable_to_non_nullable
              as String,
      ky_hieu: null == ky_hieu
          ? _value.ky_hieu
          : ky_hieu // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitModelImplCopyWith<$Res>
    implements $UnitModelCopyWith<$Res> {
  factory _$$UnitModelImplCopyWith(
          _$UnitModelImpl value, $Res Function(_$UnitModelImpl) then) =
      __$$UnitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String ten_don_vi, String ky_hieu});
}

/// @nodoc
class __$$UnitModelImplCopyWithImpl<$Res>
    extends _$UnitModelCopyWithImpl<$Res, _$UnitModelImpl>
    implements _$$UnitModelImplCopyWith<$Res> {
  __$$UnitModelImplCopyWithImpl(
      _$UnitModelImpl _value, $Res Function(_$UnitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? ten_don_vi = null,
    Object? ky_hieu = null,
  }) {
    return _then(_$UnitModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ten_don_vi: null == ten_don_vi
          ? _value.ten_don_vi
          : ten_don_vi // ignore: cast_nullable_to_non_nullable
              as String,
      ky_hieu: null == ky_hieu
          ? _value.ky_hieu
          : ky_hieu // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitModelImpl implements _UnitModel {
  const _$UnitModelImpl(
      {this.uid = '', this.ten_don_vi = '', this.ky_hieu = ''});

  factory _$UnitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitModelImplFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String ten_don_vi;
  @override
  @JsonKey()
  final String ky_hieu;

  @override
  String toString() {
    return 'UnitModel(uid: $uid, ten_don_vi: $ten_don_vi, ky_hieu: $ky_hieu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.ten_don_vi, ten_don_vi) ||
                other.ten_don_vi == ten_don_vi) &&
            (identical(other.ky_hieu, ky_hieu) || other.ky_hieu == ky_hieu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, ten_don_vi, ky_hieu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitModelImplCopyWith<_$UnitModelImpl> get copyWith =>
      __$$UnitModelImplCopyWithImpl<_$UnitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitModelImplToJson(
      this,
    );
  }
}

abstract class _UnitModel implements UnitModel {
  const factory _UnitModel(
      {final String uid,
      final String ten_don_vi,
      final String ky_hieu}) = _$UnitModelImpl;

  factory _UnitModel.fromJson(Map<String, dynamic> json) =
      _$UnitModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get ten_don_vi;
  @override
  String get ky_hieu;
  @override
  @JsonKey(ignore: true)
  _$$UnitModelImplCopyWith<_$UnitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
