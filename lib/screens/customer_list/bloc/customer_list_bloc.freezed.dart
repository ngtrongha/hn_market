// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String uid) delete,
    required TResult Function(String value) onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String uid)? delete,
    TResult Function(String value)? onChangeString,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Delete value)? delete,
    TResult Function(OnChangeString value)? onChangeString,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerListEventCopyWith<$Res> {
  factory $CustomerListEventCopyWith(
          CustomerListEvent value, $Res Function(CustomerListEvent) then) =
      _$CustomerListEventCopyWithImpl<$Res, CustomerListEvent>;
}

/// @nodoc
class _$CustomerListEventCopyWithImpl<$Res, $Val extends CustomerListEvent>
    implements $CustomerListEventCopyWith<$Res> {
  _$CustomerListEventCopyWithImpl(this._value, this._then);

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
    extends _$CustomerListEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CustomerListEvent.started()';
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
    required TResult Function(String uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String uid)? delete,
    TResult Function(String value)? onChangeString,
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
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Delete value)? delete,
    TResult Function(OnChangeString value)? onChangeString,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements CustomerListEvent {
  const factory Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$CustomerListEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$DeleteImpl(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements Delete {
  const _$DeleteImpl(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'CustomerListEvent.delete(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return delete(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return delete?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String uid)? delete,
    TResult Function(String value)? onChangeString,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Delete value)? delete,
    TResult Function(OnChangeString value)? onChangeString,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete implements CustomerListEvent {
  const factory Delete(final String uid) = _$DeleteImpl;

  String get uid;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeStringImplCopyWith<$Res> {
  factory _$$OnChangeStringImplCopyWith(_$OnChangeStringImpl value,
          $Res Function(_$OnChangeStringImpl) then) =
      __$$OnChangeStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$OnChangeStringImplCopyWithImpl<$Res>
    extends _$CustomerListEventCopyWithImpl<$Res, _$OnChangeStringImpl>
    implements _$$OnChangeStringImplCopyWith<$Res> {
  __$$OnChangeStringImplCopyWithImpl(
      _$OnChangeStringImpl _value, $Res Function(_$OnChangeStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$OnChangeStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnChangeStringImpl implements OnChangeString {
  const _$OnChangeStringImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'CustomerListEvent.onChangeString(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeStringImplCopyWith<_$OnChangeStringImpl> get copyWith =>
      __$$OnChangeStringImplCopyWithImpl<_$OnChangeStringImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return onChangeString(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return onChangeString?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String uid)? delete,
    TResult Function(String value)? onChangeString,
    required TResult orElse(),
  }) {
    if (onChangeString != null) {
      return onChangeString(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return onChangeString(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return onChangeString?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Delete value)? delete,
    TResult Function(OnChangeString value)? onChangeString,
    required TResult orElse(),
  }) {
    if (onChangeString != null) {
      return onChangeString(this);
    }
    return orElse();
  }
}

abstract class OnChangeString implements CustomerListEvent {
  const factory OnChangeString(final String value) = _$OnChangeStringImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$OnChangeStringImplCopyWith<_$OnChangeStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerListState {
  List<CustomerModel> get list_value => throw _privateConstructorUsedError;
  List<OrderModel> get list_order => throw _privateConstructorUsedError;
  String get search_text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerListStateCopyWith<CustomerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerListStateCopyWith<$Res> {
  factory $CustomerListStateCopyWith(
          CustomerListState value, $Res Function(CustomerListState) then) =
      _$CustomerListStateCopyWithImpl<$Res, CustomerListState>;
  @useResult
  $Res call(
      {List<CustomerModel> list_value,
      List<OrderModel> list_order,
      String search_text});
}

/// @nodoc
class _$CustomerListStateCopyWithImpl<$Res, $Val extends CustomerListState>
    implements $CustomerListStateCopyWith<$Res> {
  _$CustomerListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list_value = null,
    Object? list_order = null,
    Object? search_text = null,
  }) {
    return _then(_value.copyWith(
      list_value: null == list_value
          ? _value.list_value
          : list_value // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>,
      list_order: null == list_order
          ? _value.list_order
          : list_order // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      search_text: null == search_text
          ? _value.search_text
          : search_text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerListStateImplCopyWith<$Res>
    implements $CustomerListStateCopyWith<$Res> {
  factory _$$CustomerListStateImplCopyWith(_$CustomerListStateImpl value,
          $Res Function(_$CustomerListStateImpl) then) =
      __$$CustomerListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerModel> list_value,
      List<OrderModel> list_order,
      String search_text});
}

/// @nodoc
class __$$CustomerListStateImplCopyWithImpl<$Res>
    extends _$CustomerListStateCopyWithImpl<$Res, _$CustomerListStateImpl>
    implements _$$CustomerListStateImplCopyWith<$Res> {
  __$$CustomerListStateImplCopyWithImpl(_$CustomerListStateImpl _value,
      $Res Function(_$CustomerListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list_value = null,
    Object? list_order = null,
    Object? search_text = null,
  }) {
    return _then(_$CustomerListStateImpl(
      list_value: null == list_value
          ? _value._list_value
          : list_value // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>,
      list_order: null == list_order
          ? _value._list_order
          : list_order // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      search_text: null == search_text
          ? _value.search_text
          : search_text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerListStateImpl implements _CustomerListState {
  const _$CustomerListStateImpl(
      {final List<CustomerModel> list_value = const [],
      final List<OrderModel> list_order = const [],
      this.search_text = ''})
      : _list_value = list_value,
        _list_order = list_order;

  final List<CustomerModel> _list_value;
  @override
  @JsonKey()
  List<CustomerModel> get list_value {
    if (_list_value is EqualUnmodifiableListView) return _list_value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list_value);
  }

  final List<OrderModel> _list_order;
  @override
  @JsonKey()
  List<OrderModel> get list_order {
    if (_list_order is EqualUnmodifiableListView) return _list_order;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list_order);
  }

  @override
  @JsonKey()
  final String search_text;

  @override
  String toString() {
    return 'CustomerListState(list_value: $list_value, list_order: $list_order, search_text: $search_text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._list_value, _list_value) &&
            const DeepCollectionEquality()
                .equals(other._list_order, _list_order) &&
            (identical(other.search_text, search_text) ||
                other.search_text == search_text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list_value),
      const DeepCollectionEquality().hash(_list_order),
      search_text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerListStateImplCopyWith<_$CustomerListStateImpl> get copyWith =>
      __$$CustomerListStateImplCopyWithImpl<_$CustomerListStateImpl>(
          this, _$identity);
}

abstract class _CustomerListState implements CustomerListState {
  const factory _CustomerListState(
      {final List<CustomerModel> list_value,
      final List<OrderModel> list_order,
      final String search_text}) = _$CustomerListStateImpl;

  @override
  List<CustomerModel> get list_value;
  @override
  List<OrderModel> get list_order;
  @override
  String get search_text;
  @override
  @JsonKey(ignore: true)
  _$$CustomerListStateImplCopyWith<_$CustomerListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
