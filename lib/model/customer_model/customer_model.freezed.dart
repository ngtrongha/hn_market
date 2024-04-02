// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  String get uid => throw _privateConstructorUsedError;
  String get ten_khach_hang => throw _privateConstructorUsedError;
  String get hinh_khach_hang => throw _privateConstructorUsedError;
  String get sdt_khach_hang => throw _privateConstructorUsedError;
  String get dia_chi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res, CustomerModel>;
  @useResult
  $Res call(
      {String uid,
      String ten_khach_hang,
      String hinh_khach_hang,
      String sdt_khach_hang,
      String dia_chi});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res, $Val extends CustomerModel>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? ten_khach_hang = null,
    Object? hinh_khach_hang = null,
    Object? sdt_khach_hang = null,
    Object? dia_chi = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ten_khach_hang: null == ten_khach_hang
          ? _value.ten_khach_hang
          : ten_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      hinh_khach_hang: null == hinh_khach_hang
          ? _value.hinh_khach_hang
          : hinh_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      sdt_khach_hang: null == sdt_khach_hang
          ? _value.sdt_khach_hang
          : sdt_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      dia_chi: null == dia_chi
          ? _value.dia_chi
          : dia_chi // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerModelImplCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$CustomerModelImplCopyWith(
          _$CustomerModelImpl value, $Res Function(_$CustomerModelImpl) then) =
      __$$CustomerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String ten_khach_hang,
      String hinh_khach_hang,
      String sdt_khach_hang,
      String dia_chi});
}

/// @nodoc
class __$$CustomerModelImplCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res, _$CustomerModelImpl>
    implements _$$CustomerModelImplCopyWith<$Res> {
  __$$CustomerModelImplCopyWithImpl(
      _$CustomerModelImpl _value, $Res Function(_$CustomerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? ten_khach_hang = null,
    Object? hinh_khach_hang = null,
    Object? sdt_khach_hang = null,
    Object? dia_chi = null,
  }) {
    return _then(_$CustomerModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ten_khach_hang: null == ten_khach_hang
          ? _value.ten_khach_hang
          : ten_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      hinh_khach_hang: null == hinh_khach_hang
          ? _value.hinh_khach_hang
          : hinh_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      sdt_khach_hang: null == sdt_khach_hang
          ? _value.sdt_khach_hang
          : sdt_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      dia_chi: null == dia_chi
          ? _value.dia_chi
          : dia_chi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerModelImpl implements _CustomerModel {
  const _$CustomerModelImpl(
      {this.uid = '',
      this.ten_khach_hang = '',
      this.hinh_khach_hang = '',
      this.sdt_khach_hang = '',
      this.dia_chi = ''});

  factory _$CustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerModelImplFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String ten_khach_hang;
  @override
  @JsonKey()
  final String hinh_khach_hang;
  @override
  @JsonKey()
  final String sdt_khach_hang;
  @override
  @JsonKey()
  final String dia_chi;

  @override
  String toString() {
    return 'CustomerModel(uid: $uid, ten_khach_hang: $ten_khach_hang, hinh_khach_hang: $hinh_khach_hang, sdt_khach_hang: $sdt_khach_hang, dia_chi: $dia_chi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.ten_khach_hang, ten_khach_hang) ||
                other.ten_khach_hang == ten_khach_hang) &&
            (identical(other.hinh_khach_hang, hinh_khach_hang) ||
                other.hinh_khach_hang == hinh_khach_hang) &&
            (identical(other.sdt_khach_hang, sdt_khach_hang) ||
                other.sdt_khach_hang == sdt_khach_hang) &&
            (identical(other.dia_chi, dia_chi) || other.dia_chi == dia_chi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, ten_khach_hang,
      hinh_khach_hang, sdt_khach_hang, dia_chi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      __$$CustomerModelImplCopyWithImpl<_$CustomerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {final String uid,
      final String ten_khach_hang,
      final String hinh_khach_hang,
      final String sdt_khach_hang,
      final String dia_chi}) = _$CustomerModelImpl;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$CustomerModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get ten_khach_hang;
  @override
  String get hinh_khach_hang;
  @override
  String get sdt_khach_hang;
  @override
  String get dia_chi;
  @override
  @JsonKey(ignore: true)
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
