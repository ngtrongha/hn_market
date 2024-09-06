// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_entry_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerEntryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEntryEventCopyWith<$Res> {
  factory $CustomerEntryEventCopyWith(
          CustomerEntryEvent value, $Res Function(CustomerEntryEvent) then) =
      _$CustomerEntryEventCopyWithImpl<$Res, CustomerEntryEvent>;
}

/// @nodoc
class _$CustomerEntryEventCopyWithImpl<$Res, $Val extends CustomerEntryEvent>
    implements $CustomerEntryEventCopyWith<$Res> {
  _$CustomerEntryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CustomerEntryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CustomerEntryEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements CustomerEntryEvent {
  const factory Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$CustomerEntryEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateImpl implements Create {
  const _$CreateImpl();

  @override
  String toString() {
    return 'CustomerEntryEvent.create()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class Create implements CustomerEntryEvent {
  const factory Create() = _$CreateImpl;
}

/// @nodoc
abstract class _$$ChooseImageImplCopyWith<$Res> {
  factory _$$ChooseImageImplCopyWith(
          _$ChooseImageImpl value, $Res Function(_$ChooseImageImpl) then) =
      __$$ChooseImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChooseImageImplCopyWithImpl<$Res>
    extends _$CustomerEntryEventCopyWithImpl<$Res, _$ChooseImageImpl>
    implements _$$ChooseImageImplCopyWith<$Res> {
  __$$ChooseImageImplCopyWithImpl(
      _$ChooseImageImpl _value, $Res Function(_$ChooseImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChooseImageImpl implements ChooseImage {
  const _$ChooseImageImpl();

  @override
  String toString() {
    return 'CustomerEntryEvent.chooseImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChooseImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
  }) {
    return chooseImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
  }) {
    return chooseImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    required TResult orElse(),
  }) {
    if (chooseImage != null) {
      return chooseImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
  }) {
    return chooseImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
  }) {
    return chooseImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    required TResult orElse(),
  }) {
    if (chooseImage != null) {
      return chooseImage(this);
    }
    return orElse();
  }
}

abstract class ChooseImage implements CustomerEntryEvent {
  const factory ChooseImage() = _$ChooseImageImpl;
}

/// @nodoc
abstract class _$$ChangeStringImplCopyWith<$Res> {
  factory _$$ChangeStringImplCopyWith(
          _$ChangeStringImpl value, $Res Function(_$ChangeStringImpl) then) =
      __$$ChangeStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class __$$ChangeStringImplCopyWithImpl<$Res>
    extends _$CustomerEntryEventCopyWithImpl<$Res, _$ChangeStringImpl>
    implements _$$ChangeStringImplCopyWith<$Res> {
  __$$ChangeStringImplCopyWithImpl(
      _$ChangeStringImpl _value, $Res Function(_$ChangeStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$ChangeStringImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeStringImpl implements ChangeString {
  const _$ChangeStringImpl(this.key, this.value);

  @override
  final String key;
  @override
  final String value;

  @override
  String toString() {
    return 'CustomerEntryEvent.changeString(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStringImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStringImplCopyWith<_$ChangeStringImpl> get copyWith =>
      __$$ChangeStringImplCopyWithImpl<_$ChangeStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
  }) {
    return changeString(key, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
  }) {
    return changeString?.call(key, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    required TResult orElse(),
  }) {
    if (changeString != null) {
      return changeString(key, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
  }) {
    return changeString(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
  }) {
    return changeString?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    required TResult orElse(),
  }) {
    if (changeString != null) {
      return changeString(this);
    }
    return orElse();
  }
}

abstract class ChangeString implements CustomerEntryEvent {
  const factory ChangeString(final String key, final String value) =
      _$ChangeStringImpl;

  String get key;
  String get value;

  /// Create a copy of CustomerEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeStringImplCopyWith<_$ChangeStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerEntryState {
  String get ten_khach_hang => throw _privateConstructorUsedError;
  Uint8List? get hinh_khach_hang => throw _privateConstructorUsedError;
  String get sdt_khach_hang => throw _privateConstructorUsedError;
  String? get dia_chi => throw _privateConstructorUsedError;
  List<OrderModel> get list_order => throw _privateConstructorUsedError;

  /// Create a copy of CustomerEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerEntryStateCopyWith<CustomerEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEntryStateCopyWith<$Res> {
  factory $CustomerEntryStateCopyWith(
          CustomerEntryState value, $Res Function(CustomerEntryState) then) =
      _$CustomerEntryStateCopyWithImpl<$Res, CustomerEntryState>;
  @useResult
  $Res call(
      {String ten_khach_hang,
      Uint8List? hinh_khach_hang,
      String sdt_khach_hang,
      String? dia_chi,
      List<OrderModel> list_order});
}

/// @nodoc
class _$CustomerEntryStateCopyWithImpl<$Res, $Val extends CustomerEntryState>
    implements $CustomerEntryStateCopyWith<$Res> {
  _$CustomerEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ten_khach_hang = null,
    Object? hinh_khach_hang = freezed,
    Object? sdt_khach_hang = null,
    Object? dia_chi = freezed,
    Object? list_order = null,
  }) {
    return _then(_value.copyWith(
      ten_khach_hang: null == ten_khach_hang
          ? _value.ten_khach_hang
          : ten_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      hinh_khach_hang: freezed == hinh_khach_hang
          ? _value.hinh_khach_hang
          : hinh_khach_hang // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      sdt_khach_hang: null == sdt_khach_hang
          ? _value.sdt_khach_hang
          : sdt_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      dia_chi: freezed == dia_chi
          ? _value.dia_chi
          : dia_chi // ignore: cast_nullable_to_non_nullable
              as String?,
      list_order: null == list_order
          ? _value.list_order
          : list_order // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerEntryStateImplCopyWith<$Res>
    implements $CustomerEntryStateCopyWith<$Res> {
  factory _$$CustomerEntryStateImplCopyWith(_$CustomerEntryStateImpl value,
          $Res Function(_$CustomerEntryStateImpl) then) =
      __$$CustomerEntryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ten_khach_hang,
      Uint8List? hinh_khach_hang,
      String sdt_khach_hang,
      String? dia_chi,
      List<OrderModel> list_order});
}

/// @nodoc
class __$$CustomerEntryStateImplCopyWithImpl<$Res>
    extends _$CustomerEntryStateCopyWithImpl<$Res, _$CustomerEntryStateImpl>
    implements _$$CustomerEntryStateImplCopyWith<$Res> {
  __$$CustomerEntryStateImplCopyWithImpl(_$CustomerEntryStateImpl _value,
      $Res Function(_$CustomerEntryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ten_khach_hang = null,
    Object? hinh_khach_hang = freezed,
    Object? sdt_khach_hang = null,
    Object? dia_chi = freezed,
    Object? list_order = null,
  }) {
    return _then(_$CustomerEntryStateImpl(
      ten_khach_hang: null == ten_khach_hang
          ? _value.ten_khach_hang
          : ten_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      hinh_khach_hang: freezed == hinh_khach_hang
          ? _value.hinh_khach_hang
          : hinh_khach_hang // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      sdt_khach_hang: null == sdt_khach_hang
          ? _value.sdt_khach_hang
          : sdt_khach_hang // ignore: cast_nullable_to_non_nullable
              as String,
      dia_chi: freezed == dia_chi
          ? _value.dia_chi
          : dia_chi // ignore: cast_nullable_to_non_nullable
              as String?,
      list_order: null == list_order
          ? _value._list_order
          : list_order // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ));
  }
}

/// @nodoc

class _$CustomerEntryStateImpl implements _CustomerEntryState {
  const _$CustomerEntryStateImpl(
      {this.ten_khach_hang = '',
      this.hinh_khach_hang,
      this.sdt_khach_hang = '',
      this.dia_chi,
      final List<OrderModel> list_order = const []})
      : _list_order = list_order;

  @override
  @JsonKey()
  final String ten_khach_hang;
  @override
  final Uint8List? hinh_khach_hang;
  @override
  @JsonKey()
  final String sdt_khach_hang;
  @override
  final String? dia_chi;
  final List<OrderModel> _list_order;
  @override
  @JsonKey()
  List<OrderModel> get list_order {
    if (_list_order is EqualUnmodifiableListView) return _list_order;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list_order);
  }

  @override
  String toString() {
    return 'CustomerEntryState(ten_khach_hang: $ten_khach_hang, hinh_khach_hang: $hinh_khach_hang, sdt_khach_hang: $sdt_khach_hang, dia_chi: $dia_chi, list_order: $list_order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerEntryStateImpl &&
            (identical(other.ten_khach_hang, ten_khach_hang) ||
                other.ten_khach_hang == ten_khach_hang) &&
            const DeepCollectionEquality()
                .equals(other.hinh_khach_hang, hinh_khach_hang) &&
            (identical(other.sdt_khach_hang, sdt_khach_hang) ||
                other.sdt_khach_hang == sdt_khach_hang) &&
            (identical(other.dia_chi, dia_chi) || other.dia_chi == dia_chi) &&
            const DeepCollectionEquality()
                .equals(other._list_order, _list_order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      ten_khach_hang,
      const DeepCollectionEquality().hash(hinh_khach_hang),
      sdt_khach_hang,
      dia_chi,
      const DeepCollectionEquality().hash(_list_order));

  /// Create a copy of CustomerEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerEntryStateImplCopyWith<_$CustomerEntryStateImpl> get copyWith =>
      __$$CustomerEntryStateImplCopyWithImpl<_$CustomerEntryStateImpl>(
          this, _$identity);
}

abstract class _CustomerEntryState implements CustomerEntryState {
  const factory _CustomerEntryState(
      {final String ten_khach_hang,
      final Uint8List? hinh_khach_hang,
      final String sdt_khach_hang,
      final String? dia_chi,
      final List<OrderModel> list_order}) = _$CustomerEntryStateImpl;

  @override
  String get ten_khach_hang;
  @override
  Uint8List? get hinh_khach_hang;
  @override
  String get sdt_khach_hang;
  @override
  String? get dia_chi;
  @override
  List<OrderModel> get list_order;

  /// Create a copy of CustomerEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerEntryStateImplCopyWith<_$CustomerEntryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
