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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(ChooseImage value) chooseImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
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
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
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
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
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
  }) {
    return chooseImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function()? chooseImage,
  }) {
    return chooseImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function()? chooseImage,
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
  }) {
    return chooseImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(ChooseImage value)? chooseImage,
  }) {
    return chooseImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(ChooseImage value)? chooseImage,
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
mixin _$CustomerEntryState {
  CustomerModel get detail => throw _privateConstructorUsedError;
  AssetEntity? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerEntryStateCopyWith<CustomerEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEntryStateCopyWith<$Res> {
  factory $CustomerEntryStateCopyWith(
          CustomerEntryState value, $Res Function(CustomerEntryState) then) =
      _$CustomerEntryStateCopyWithImpl<$Res, CustomerEntryState>;
  @useResult
  $Res call({CustomerModel detail, AssetEntity? image});

  $CustomerModelCopyWith<$Res> get detail;
}

/// @nodoc
class _$CustomerEntryStateCopyWithImpl<$Res, $Val extends CustomerEntryState>
    implements $CustomerEntryStateCopyWith<$Res> {
  _$CustomerEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as AssetEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res> get detail {
    return $CustomerModelCopyWith<$Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
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
  $Res call({CustomerModel detail, AssetEntity? image});

  @override
  $CustomerModelCopyWith<$Res> get detail;
}

/// @nodoc
class __$$CustomerEntryStateImplCopyWithImpl<$Res>
    extends _$CustomerEntryStateCopyWithImpl<$Res, _$CustomerEntryStateImpl>
    implements _$$CustomerEntryStateImplCopyWith<$Res> {
  __$$CustomerEntryStateImplCopyWithImpl(_$CustomerEntryStateImpl _value,
      $Res Function(_$CustomerEntryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? image = freezed,
  }) {
    return _then(_$CustomerEntryStateImpl(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as AssetEntity?,
    ));
  }
}

/// @nodoc

class _$CustomerEntryStateImpl implements _CustomerEntryState {
  const _$CustomerEntryStateImpl(
      {this.detail = const CustomerModel(), this.image});

  @override
  @JsonKey()
  final CustomerModel detail;
  @override
  final AssetEntity? image;

  @override
  String toString() {
    return 'CustomerEntryState(detail: $detail, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerEntryStateImpl &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerEntryStateImplCopyWith<_$CustomerEntryStateImpl> get copyWith =>
      __$$CustomerEntryStateImplCopyWithImpl<_$CustomerEntryStateImpl>(
          this, _$identity);
}

abstract class _CustomerEntryState implements CustomerEntryState {
  const factory _CustomerEntryState(
      {final CustomerModel detail,
      final AssetEntity? image}) = _$CustomerEntryStateImpl;

  @override
  CustomerModel get detail;
  @override
  AssetEntity? get image;
  @override
  @JsonKey(ignore: true)
  _$$CustomerEntryStateImplCopyWith<_$CustomerEntryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
