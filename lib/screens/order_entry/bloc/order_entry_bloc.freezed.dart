// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entry_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEntryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntryEventCopyWith<$Res> {
  factory $OrderEntryEventCopyWith(
          OrderEntryEvent value, $Res Function(OrderEntryEvent) then) =
      _$OrderEntryEventCopyWithImpl<$Res, OrderEntryEvent>;
}

/// @nodoc
class _$OrderEntryEventCopyWithImpl<$Res, $Val extends OrderEntryEvent>
    implements $OrderEntryEventCopyWith<$Res> {
  _$OrderEntryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEntryEvent
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
    extends _$OrderEntryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.started()';
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
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
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
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements OrderEntryEvent {
  const factory Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ChangeBoolImplCopyWith<$Res> {
  factory _$$ChangeBoolImplCopyWith(
          _$ChangeBoolImpl value, $Res Function(_$ChangeBoolImpl) then) =
      __$$ChangeBoolImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$ChangeBoolImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$ChangeBoolImpl>
    implements _$$ChangeBoolImplCopyWith<$Res> {
  __$$ChangeBoolImplCopyWithImpl(
      _$ChangeBoolImpl _value, $Res Function(_$ChangeBoolImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$ChangeBoolImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeBoolImpl implements ChangeBool {
  const _$ChangeBoolImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'OrderEntryEvent.changeBool(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeBoolImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeBoolImplCopyWith<_$ChangeBoolImpl> get copyWith =>
      __$$ChangeBoolImplCopyWithImpl<_$ChangeBoolImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return changeBool(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return changeBool?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (changeBool != null) {
      return changeBool(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return changeBool(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return changeBool?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (changeBool != null) {
      return changeBool(this);
    }
    return orElse();
  }
}

abstract class ChangeBool implements OrderEntryEvent {
  const factory ChangeBool(final String key) = _$ChangeBoolImpl;

  String get key;

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeBoolImplCopyWith<_$ChangeBoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddProductByScanImplCopyWith<$Res> {
  factory _$$AddProductByScanImplCopyWith(_$AddProductByScanImpl value,
          $Res Function(_$AddProductByScanImpl) then) =
      __$$AddProductByScanImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddProductByScanImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$AddProductByScanImpl>
    implements _$$AddProductByScanImplCopyWith<$Res> {
  __$$AddProductByScanImplCopyWithImpl(_$AddProductByScanImpl _value,
      $Res Function(_$AddProductByScanImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddProductByScanImpl implements AddProductByScan {
  const _$AddProductByScanImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.addProductByScan()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddProductByScanImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return addProductByScan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return addProductByScan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (addProductByScan != null) {
      return addProductByScan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return addProductByScan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return addProductByScan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (addProductByScan != null) {
      return addProductByScan(this);
    }
    return orElse();
  }
}

abstract class AddProductByScan implements OrderEntryEvent {
  const factory AddProductByScan() = _$AddProductByScanImpl;
}

/// @nodoc
abstract class _$$AddProductByChooseImplCopyWith<$Res> {
  factory _$$AddProductByChooseImplCopyWith(_$AddProductByChooseImpl value,
          $Res Function(_$AddProductByChooseImpl) then) =
      __$$AddProductByChooseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddProductByChooseImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$AddProductByChooseImpl>
    implements _$$AddProductByChooseImplCopyWith<$Res> {
  __$$AddProductByChooseImplCopyWithImpl(_$AddProductByChooseImpl _value,
      $Res Function(_$AddProductByChooseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddProductByChooseImpl implements AddProductByChoose {
  const _$AddProductByChooseImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.addProductByChoose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddProductByChooseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return addProductByChoose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return addProductByChoose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (addProductByChoose != null) {
      return addProductByChoose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return addProductByChoose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return addProductByChoose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (addProductByChoose != null) {
      return addProductByChoose(this);
    }
    return orElse();
  }
}

abstract class AddProductByChoose implements OrderEntryEvent {
  const factory AddProductByChoose() = _$AddProductByChooseImpl;
}

/// @nodoc
abstract class _$$RemoveProductImplCopyWith<$Res> {
  factory _$$RemoveProductImplCopyWith(
          _$RemoveProductImpl value, $Res Function(_$RemoveProductImpl) then) =
      __$$RemoveProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductItem data});
}

/// @nodoc
class __$$RemoveProductImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$RemoveProductImpl>
    implements _$$RemoveProductImplCopyWith<$Res> {
  __$$RemoveProductImplCopyWithImpl(
      _$RemoveProductImpl _value, $Res Function(_$RemoveProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RemoveProductImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductItem,
    ));
  }
}

/// @nodoc

class _$RemoveProductImpl implements RemoveProduct {
  const _$RemoveProductImpl(this.data);

  @override
  final ProductItem data;

  @override
  String toString() {
    return 'OrderEntryEvent.removeProduct(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      __$$RemoveProductImplCopyWithImpl<_$RemoveProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return removeProduct(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return removeProduct?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class RemoveProduct implements OrderEntryEvent {
  const factory RemoveProduct(final ProductItem data) = _$RemoveProductImpl;

  ProductItem get data;

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeAmountImplCopyWith<$Res> {
  factory _$$ChangeAmountImplCopyWith(
          _$ChangeAmountImpl value, $Res Function(_$ChangeAmountImpl) then) =
      __$$ChangeAmountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductItem data, int value});
}

/// @nodoc
class __$$ChangeAmountImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$ChangeAmountImpl>
    implements _$$ChangeAmountImplCopyWith<$Res> {
  __$$ChangeAmountImplCopyWithImpl(
      _$ChangeAmountImpl _value, $Res Function(_$ChangeAmountImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? value = null,
  }) {
    return _then(_$ChangeAmountImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductItem,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeAmountImpl implements ChangeAmount {
  const _$ChangeAmountImpl(this.data, this.value);

  @override
  final ProductItem data;
  @override
  final int value;

  @override
  String toString() {
    return 'OrderEntryEvent.changeAmount(data: $data, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeAmountImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, value);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeAmountImplCopyWith<_$ChangeAmountImpl> get copyWith =>
      __$$ChangeAmountImplCopyWithImpl<_$ChangeAmountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return changeAmount(data, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return changeAmount?.call(data, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (changeAmount != null) {
      return changeAmount(data, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return changeAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return changeAmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (changeAmount != null) {
      return changeAmount(this);
    }
    return orElse();
  }
}

abstract class ChangeAmount implements OrderEntryEvent {
  const factory ChangeAmount(final ProductItem data, final int value) =
      _$ChangeAmountImpl;

  ProductItem get data;
  int get value;

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeAmountImplCopyWith<_$ChangeAmountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChoosePriceImplCopyWith<$Res> {
  factory _$$ChoosePriceImplCopyWith(
          _$ChoosePriceImpl value, $Res Function(_$ChoosePriceImpl) then) =
      __$$ChoosePriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductItem data, PriceList value});
}

/// @nodoc
class __$$ChoosePriceImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$ChoosePriceImpl>
    implements _$$ChoosePriceImplCopyWith<$Res> {
  __$$ChoosePriceImplCopyWithImpl(
      _$ChoosePriceImpl _value, $Res Function(_$ChoosePriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? value = null,
  }) {
    return _then(_$ChoosePriceImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductItem,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PriceList,
    ));
  }
}

/// @nodoc

class _$ChoosePriceImpl implements ChoosePrice {
  const _$ChoosePriceImpl(this.data, this.value);

  @override
  final ProductItem data;
  @override
  final PriceList value;

  @override
  String toString() {
    return 'OrderEntryEvent.choosePrice(data: $data, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoosePriceImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, value);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoosePriceImplCopyWith<_$ChoosePriceImpl> get copyWith =>
      __$$ChoosePriceImplCopyWithImpl<_$ChoosePriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return choosePrice(data, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return choosePrice?.call(data, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (choosePrice != null) {
      return choosePrice(data, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return choosePrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return choosePrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (choosePrice != null) {
      return choosePrice(this);
    }
    return orElse();
  }
}

abstract class ChoosePrice implements OrderEntryEvent {
  const factory ChoosePrice(final ProductItem data, final PriceList value) =
      _$ChoosePriceImpl;

  ProductItem get data;
  PriceList get value;

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChoosePriceImplCopyWith<_$ChoosePriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChooseImageImplCopyWith<$Res> {
  factory _$$ChooseImageImplCopyWith(
          _$ChooseImageImpl value, $Res Function(_$ChooseImageImpl) then) =
      __$$ChooseImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChooseImageImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$ChooseImageImpl>
    implements _$$ChooseImageImplCopyWith<$Res> {
  __$$ChooseImageImplCopyWithImpl(
      _$ChooseImageImpl _value, $Res Function(_$ChooseImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChooseImageImpl implements ChooseImage {
  const _$ChooseImageImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.chooseImage()';
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
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return chooseImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return chooseImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
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
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return chooseImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return chooseImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (chooseImage != null) {
      return chooseImage(this);
    }
    return orElse();
  }
}

abstract class ChooseImage implements OrderEntryEvent {
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
    extends _$OrderEntryEventCopyWithImpl<$Res, _$ChangeStringImpl>
    implements _$$ChangeStringImplCopyWith<$Res> {
  __$$ChangeStringImplCopyWithImpl(
      _$ChangeStringImpl _value, $Res Function(_$ChangeStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
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
    return 'OrderEntryEvent.changeString(key: $key, value: $value)';
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

  /// Create a copy of OrderEntryEvent
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
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return changeString(key, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return changeString?.call(key, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
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
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return changeString(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return changeString?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (changeString != null) {
      return changeString(this);
    }
    return orElse();
  }
}

abstract class ChangeString implements OrderEntryEvent {
  const factory ChangeString(final String key, final String value) =
      _$ChangeStringImpl;

  String get key;
  String get value;

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeStringImplCopyWith<_$ChangeStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateImpl implements Create {
  const _$CreateImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.create()';
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
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
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
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class Create implements OrderEntryEvent {
  const factory Create() = _$CreateImpl;
}

/// @nodoc
abstract class _$$GetTotalImplCopyWith<$Res> {
  factory _$$GetTotalImplCopyWith(
          _$GetTotalImpl value, $Res Function(_$GetTotalImpl) then) =
      __$$GetTotalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTotalImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$GetTotalImpl>
    implements _$$GetTotalImplCopyWith<$Res> {
  __$$GetTotalImplCopyWithImpl(
      _$GetTotalImpl _value, $Res Function(_$GetTotalImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTotalImpl implements GetTotal {
  const _$GetTotalImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.getTotal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTotalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return getTotal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return getTotal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (getTotal != null) {
      return getTotal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return getTotal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return getTotal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (getTotal != null) {
      return getTotal(this);
    }
    return orElse();
  }
}

abstract class GetTotal implements OrderEntryEvent {
  const factory GetTotal() = _$GetTotalImpl;
}

/// @nodoc
abstract class _$$ChooseCustomerImplCopyWith<$Res> {
  factory _$$ChooseCustomerImplCopyWith(_$ChooseCustomerImpl value,
          $Res Function(_$ChooseCustomerImpl) then) =
      __$$ChooseCustomerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChooseCustomerImplCopyWithImpl<$Res>
    extends _$OrderEntryEventCopyWithImpl<$Res, _$ChooseCustomerImpl>
    implements _$$ChooseCustomerImplCopyWith<$Res> {
  __$$ChooseCustomerImplCopyWithImpl(
      _$ChooseCustomerImpl _value, $Res Function(_$ChooseCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChooseCustomerImpl implements ChooseCustomer {
  const _$ChooseCustomerImpl();

  @override
  String toString() {
    return 'OrderEntryEvent.chooseCustomer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChooseCustomerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String key) changeBool,
    required TResult Function() addProductByScan,
    required TResult Function() addProductByChoose,
    required TResult Function(ProductItem data) removeProduct,
    required TResult Function(ProductItem data, int value) changeAmount,
    required TResult Function(ProductItem data, PriceList value) choosePrice,
    required TResult Function() chooseImage,
    required TResult Function(String key, String value) changeString,
    required TResult Function() create,
    required TResult Function() getTotal,
    required TResult Function() chooseCustomer,
  }) {
    return chooseCustomer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String key)? changeBool,
    TResult? Function()? addProductByScan,
    TResult? Function()? addProductByChoose,
    TResult? Function(ProductItem data)? removeProduct,
    TResult? Function(ProductItem data, int value)? changeAmount,
    TResult? Function(ProductItem data, PriceList value)? choosePrice,
    TResult? Function()? chooseImage,
    TResult? Function(String key, String value)? changeString,
    TResult? Function()? create,
    TResult? Function()? getTotal,
    TResult? Function()? chooseCustomer,
  }) {
    return chooseCustomer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String key)? changeBool,
    TResult Function()? addProductByScan,
    TResult Function()? addProductByChoose,
    TResult Function(ProductItem data)? removeProduct,
    TResult Function(ProductItem data, int value)? changeAmount,
    TResult Function(ProductItem data, PriceList value)? choosePrice,
    TResult Function()? chooseImage,
    TResult Function(String key, String value)? changeString,
    TResult Function()? create,
    TResult Function()? getTotal,
    TResult Function()? chooseCustomer,
    required TResult orElse(),
  }) {
    if (chooseCustomer != null) {
      return chooseCustomer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(ChangeBool value) changeBool,
    required TResult Function(AddProductByScan value) addProductByScan,
    required TResult Function(AddProductByChoose value) addProductByChoose,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(ChangeAmount value) changeAmount,
    required TResult Function(ChoosePrice value) choosePrice,
    required TResult Function(ChooseImage value) chooseImage,
    required TResult Function(ChangeString value) changeString,
    required TResult Function(Create value) create,
    required TResult Function(GetTotal value) getTotal,
    required TResult Function(ChooseCustomer value) chooseCustomer,
  }) {
    return chooseCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(ChangeBool value)? changeBool,
    TResult? Function(AddProductByScan value)? addProductByScan,
    TResult? Function(AddProductByChoose value)? addProductByChoose,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(ChangeAmount value)? changeAmount,
    TResult? Function(ChoosePrice value)? choosePrice,
    TResult? Function(ChooseImage value)? chooseImage,
    TResult? Function(ChangeString value)? changeString,
    TResult? Function(Create value)? create,
    TResult? Function(GetTotal value)? getTotal,
    TResult? Function(ChooseCustomer value)? chooseCustomer,
  }) {
    return chooseCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(ChangeBool value)? changeBool,
    TResult Function(AddProductByScan value)? addProductByScan,
    TResult Function(AddProductByChoose value)? addProductByChoose,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(ChangeAmount value)? changeAmount,
    TResult Function(ChoosePrice value)? choosePrice,
    TResult Function(ChooseImage value)? chooseImage,
    TResult Function(ChangeString value)? changeString,
    TResult Function(Create value)? create,
    TResult Function(GetTotal value)? getTotal,
    TResult Function(ChooseCustomer value)? chooseCustomer,
    required TResult orElse(),
  }) {
    if (chooseCustomer != null) {
      return chooseCustomer(this);
    }
    return orElse();
  }
}

abstract class ChooseCustomer implements OrderEntryEvent {
  const factory ChooseCustomer() = _$ChooseCustomerImpl;
}

/// @nodoc
mixin _$OrderEntryState {
  bool get isDebt => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  DateTime? get thoi_gian_mua => throw _privateConstructorUsedError;
  int get uid_khach_hang => throw _privateConstructorUsedError;
  String get ten_khach_hang => throw _privateConstructorUsedError;
  Uint8List? get hinh_khach_hang => throw _privateConstructorUsedError;
  String get sdt_khach_hang => throw _privateConstructorUsedError;
  bool get khach_no => throw _privateConstructorUsedError;
  double get tong_tien_no => throw _privateConstructorUsedError;
  double get tong_gia => throw _privateConstructorUsedError;
  DateTime? get createDate => throw _privateConstructorUsedError;
  List<ProductItem> get list_product => throw _privateConstructorUsedError;
  AssetEntity? get image => throw _privateConstructorUsedError;

  /// Create a copy of OrderEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderEntryStateCopyWith<OrderEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntryStateCopyWith<$Res> {
  factory $OrderEntryStateCopyWith(
          OrderEntryState value, $Res Function(OrderEntryState) then) =
      _$OrderEntryStateCopyWithImpl<$Res, OrderEntryState>;
  @useResult
  $Res call(
      {bool isDebt,
      bool isLoading,
      DateTime? thoi_gian_mua,
      int uid_khach_hang,
      String ten_khach_hang,
      Uint8List? hinh_khach_hang,
      String sdt_khach_hang,
      bool khach_no,
      double tong_tien_no,
      double tong_gia,
      DateTime? createDate,
      List<ProductItem> list_product,
      AssetEntity? image});
}

/// @nodoc
class _$OrderEntryStateCopyWithImpl<$Res, $Val extends OrderEntryState>
    implements $OrderEntryStateCopyWith<$Res> {
  _$OrderEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDebt = null,
    Object? isLoading = null,
    Object? thoi_gian_mua = freezed,
    Object? uid_khach_hang = null,
    Object? ten_khach_hang = null,
    Object? hinh_khach_hang = freezed,
    Object? sdt_khach_hang = null,
    Object? khach_no = null,
    Object? tong_tien_no = null,
    Object? tong_gia = null,
    Object? createDate = freezed,
    Object? list_product = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      thoi_gian_mua: freezed == thoi_gian_mua
          ? _value.thoi_gian_mua
          : thoi_gian_mua // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid_khach_hang: null == uid_khach_hang
          ? _value.uid_khach_hang
          : uid_khach_hang // ignore: cast_nullable_to_non_nullable
              as int,
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
      khach_no: null == khach_no
          ? _value.khach_no
          : khach_no // ignore: cast_nullable_to_non_nullable
              as bool,
      tong_tien_no: null == tong_tien_no
          ? _value.tong_tien_no
          : tong_tien_no // ignore: cast_nullable_to_non_nullable
              as double,
      tong_gia: null == tong_gia
          ? _value.tong_gia
          : tong_gia // ignore: cast_nullable_to_non_nullable
              as double,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      list_product: null == list_product
          ? _value.list_product
          : list_product // ignore: cast_nullable_to_non_nullable
              as List<ProductItem>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as AssetEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderEntryStateImplCopyWith<$Res>
    implements $OrderEntryStateCopyWith<$Res> {
  factory _$$OrderEntryStateImplCopyWith(_$OrderEntryStateImpl value,
          $Res Function(_$OrderEntryStateImpl) then) =
      __$$OrderEntryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDebt,
      bool isLoading,
      DateTime? thoi_gian_mua,
      int uid_khach_hang,
      String ten_khach_hang,
      Uint8List? hinh_khach_hang,
      String sdt_khach_hang,
      bool khach_no,
      double tong_tien_no,
      double tong_gia,
      DateTime? createDate,
      List<ProductItem> list_product,
      AssetEntity? image});
}

/// @nodoc
class __$$OrderEntryStateImplCopyWithImpl<$Res>
    extends _$OrderEntryStateCopyWithImpl<$Res, _$OrderEntryStateImpl>
    implements _$$OrderEntryStateImplCopyWith<$Res> {
  __$$OrderEntryStateImplCopyWithImpl(
      _$OrderEntryStateImpl _value, $Res Function(_$OrderEntryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDebt = null,
    Object? isLoading = null,
    Object? thoi_gian_mua = freezed,
    Object? uid_khach_hang = null,
    Object? ten_khach_hang = null,
    Object? hinh_khach_hang = freezed,
    Object? sdt_khach_hang = null,
    Object? khach_no = null,
    Object? tong_tien_no = null,
    Object? tong_gia = null,
    Object? createDate = freezed,
    Object? list_product = null,
    Object? image = freezed,
  }) {
    return _then(_$OrderEntryStateImpl(
      isDebt: null == isDebt
          ? _value.isDebt
          : isDebt // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      thoi_gian_mua: freezed == thoi_gian_mua
          ? _value.thoi_gian_mua
          : thoi_gian_mua // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid_khach_hang: null == uid_khach_hang
          ? _value.uid_khach_hang
          : uid_khach_hang // ignore: cast_nullable_to_non_nullable
              as int,
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
      khach_no: null == khach_no
          ? _value.khach_no
          : khach_no // ignore: cast_nullable_to_non_nullable
              as bool,
      tong_tien_no: null == tong_tien_no
          ? _value.tong_tien_no
          : tong_tien_no // ignore: cast_nullable_to_non_nullable
              as double,
      tong_gia: null == tong_gia
          ? _value.tong_gia
          : tong_gia // ignore: cast_nullable_to_non_nullable
              as double,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      list_product: null == list_product
          ? _value._list_product
          : list_product // ignore: cast_nullable_to_non_nullable
              as List<ProductItem>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as AssetEntity?,
    ));
  }
}

/// @nodoc

class _$OrderEntryStateImpl implements _OrderEntryState {
  const _$OrderEntryStateImpl(
      {this.isDebt = false,
      this.isLoading = true,
      this.thoi_gian_mua,
      this.uid_khach_hang = 0,
      this.ten_khach_hang = '',
      this.hinh_khach_hang,
      this.sdt_khach_hang = '',
      this.khach_no = false,
      this.tong_tien_no = 0,
      this.tong_gia = 0,
      this.createDate,
      final List<ProductItem> list_product = const [],
      this.image})
      : _list_product = list_product;

  @override
  @JsonKey()
  final bool isDebt;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DateTime? thoi_gian_mua;
  @override
  @JsonKey()
  final int uid_khach_hang;
  @override
  @JsonKey()
  final String ten_khach_hang;
  @override
  final Uint8List? hinh_khach_hang;
  @override
  @JsonKey()
  final String sdt_khach_hang;
  @override
  @JsonKey()
  final bool khach_no;
  @override
  @JsonKey()
  final double tong_tien_no;
  @override
  @JsonKey()
  final double tong_gia;
  @override
  final DateTime? createDate;
  final List<ProductItem> _list_product;
  @override
  @JsonKey()
  List<ProductItem> get list_product {
    if (_list_product is EqualUnmodifiableListView) return _list_product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list_product);
  }

  @override
  final AssetEntity? image;

  @override
  String toString() {
    return 'OrderEntryState(isDebt: $isDebt, isLoading: $isLoading, thoi_gian_mua: $thoi_gian_mua, uid_khach_hang: $uid_khach_hang, ten_khach_hang: $ten_khach_hang, hinh_khach_hang: $hinh_khach_hang, sdt_khach_hang: $sdt_khach_hang, khach_no: $khach_no, tong_tien_no: $tong_tien_no, tong_gia: $tong_gia, createDate: $createDate, list_product: $list_product, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEntryStateImpl &&
            (identical(other.isDebt, isDebt) || other.isDebt == isDebt) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.thoi_gian_mua, thoi_gian_mua) ||
                other.thoi_gian_mua == thoi_gian_mua) &&
            (identical(other.uid_khach_hang, uid_khach_hang) ||
                other.uid_khach_hang == uid_khach_hang) &&
            (identical(other.ten_khach_hang, ten_khach_hang) ||
                other.ten_khach_hang == ten_khach_hang) &&
            const DeepCollectionEquality()
                .equals(other.hinh_khach_hang, hinh_khach_hang) &&
            (identical(other.sdt_khach_hang, sdt_khach_hang) ||
                other.sdt_khach_hang == sdt_khach_hang) &&
            (identical(other.khach_no, khach_no) ||
                other.khach_no == khach_no) &&
            (identical(other.tong_tien_no, tong_tien_no) ||
                other.tong_tien_no == tong_tien_no) &&
            (identical(other.tong_gia, tong_gia) ||
                other.tong_gia == tong_gia) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            const DeepCollectionEquality()
                .equals(other._list_product, _list_product) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDebt,
      isLoading,
      thoi_gian_mua,
      uid_khach_hang,
      ten_khach_hang,
      const DeepCollectionEquality().hash(hinh_khach_hang),
      sdt_khach_hang,
      khach_no,
      tong_tien_no,
      tong_gia,
      createDate,
      const DeepCollectionEquality().hash(_list_product),
      image);

  /// Create a copy of OrderEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEntryStateImplCopyWith<_$OrderEntryStateImpl> get copyWith =>
      __$$OrderEntryStateImplCopyWithImpl<_$OrderEntryStateImpl>(
          this, _$identity);
}

abstract class _OrderEntryState implements OrderEntryState {
  const factory _OrderEntryState(
      {final bool isDebt,
      final bool isLoading,
      final DateTime? thoi_gian_mua,
      final int uid_khach_hang,
      final String ten_khach_hang,
      final Uint8List? hinh_khach_hang,
      final String sdt_khach_hang,
      final bool khach_no,
      final double tong_tien_no,
      final double tong_gia,
      final DateTime? createDate,
      final List<ProductItem> list_product,
      final AssetEntity? image}) = _$OrderEntryStateImpl;

  @override
  bool get isDebt;
  @override
  bool get isLoading;
  @override
  DateTime? get thoi_gian_mua;
  @override
  int get uid_khach_hang;
  @override
  String get ten_khach_hang;
  @override
  Uint8List? get hinh_khach_hang;
  @override
  String get sdt_khach_hang;
  @override
  bool get khach_no;
  @override
  double get tong_tien_no;
  @override
  double get tong_gia;
  @override
  DateTime? get createDate;
  @override
  List<ProductItem> get list_product;
  @override
  AssetEntity? get image;

  /// Create a copy of OrderEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderEntryStateImplCopyWith<_$OrderEntryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
