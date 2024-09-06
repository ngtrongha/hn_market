// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UnitListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function(int uid) delete,
    required TResult Function(String value) onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function(int uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function(int uid)? delete,
    TResult Function(String value)? onChangeString,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Create value) create,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(Delete value)? delete,
    TResult Function(OnChangeString value)? onChangeString,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitListEventCopyWith<$Res> {
  factory $UnitListEventCopyWith(
          UnitListEvent value, $Res Function(UnitListEvent) then) =
      _$UnitListEventCopyWithImpl<$Res, UnitListEvent>;
}

/// @nodoc
class _$UnitListEventCopyWithImpl<$Res, $Val extends UnitListEvent>
    implements $UnitListEventCopyWith<$Res> {
  _$UnitListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitListEvent
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
    extends _$UnitListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UnitListEvent.started()';
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
    required TResult Function(int uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function(int uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function(int uid)? delete,
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
    required TResult Function(Create value) create,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
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

abstract class Started implements UnitListEvent {
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
    extends _$UnitListEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateImpl implements Create {
  const _$CreateImpl();

  @override
  String toString() {
    return 'UnitListEvent.create()';
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
    required TResult Function(int uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function(int uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function(int uid)? delete,
    TResult Function(String value)? onChangeString,
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
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
    TResult Function(Delete value)? delete,
    TResult Function(OnChangeString value)? onChangeString,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class Create implements UnitListEvent {
  const factory Create() = _$CreateImpl;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int uid});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$UnitListEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$DeleteImpl(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements Delete {
  const _$DeleteImpl(this.uid);

  @override
  final int uid;

  @override
  String toString() {
    return 'UnitListEvent.delete(uid: $uid)';
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

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function(int uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return delete(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function(int uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return delete?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function(int uid)? delete,
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
    required TResult Function(Create value) create,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
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

abstract class Delete implements UnitListEvent {
  const factory Delete(final int uid) = _$DeleteImpl;

  int get uid;

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    extends _$UnitListEventCopyWithImpl<$Res, _$OnChangeStringImpl>
    implements _$$OnChangeStringImplCopyWith<$Res> {
  __$$OnChangeStringImplCopyWithImpl(
      _$OnChangeStringImpl _value, $Res Function(_$OnChangeStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
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
    return 'UnitListEvent.onChangeString(value: $value)';
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

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeStringImplCopyWith<_$OnChangeStringImpl> get copyWith =>
      __$$OnChangeStringImplCopyWithImpl<_$OnChangeStringImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() create,
    required TResult Function(int uid) delete,
    required TResult Function(String value) onChangeString,
  }) {
    return onChangeString(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? create,
    TResult? Function(int uid)? delete,
    TResult? Function(String value)? onChangeString,
  }) {
    return onChangeString?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? create,
    TResult Function(int uid)? delete,
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
    required TResult Function(Create value) create,
    required TResult Function(Delete value) delete,
    required TResult Function(OnChangeString value) onChangeString,
  }) {
    return onChangeString(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Create value)? create,
    TResult? Function(Delete value)? delete,
    TResult? Function(OnChangeString value)? onChangeString,
  }) {
    return onChangeString?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Create value)? create,
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

abstract class OnChangeString implements UnitListEvent {
  const factory OnChangeString(final String value) = _$OnChangeStringImpl;

  String get value;

  /// Create a copy of UnitListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnChangeStringImplCopyWith<_$OnChangeStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UnitListState {
  String get search_text => throw _privateConstructorUsedError;
  List<UnitModel> get list_value => throw _privateConstructorUsedError;

  /// Create a copy of UnitListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitListStateCopyWith<UnitListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitListStateCopyWith<$Res> {
  factory $UnitListStateCopyWith(
          UnitListState value, $Res Function(UnitListState) then) =
      _$UnitListStateCopyWithImpl<$Res, UnitListState>;
  @useResult
  $Res call({String search_text, List<UnitModel> list_value});
}

/// @nodoc
class _$UnitListStateCopyWithImpl<$Res, $Val extends UnitListState>
    implements $UnitListStateCopyWith<$Res> {
  _$UnitListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search_text = null,
    Object? list_value = null,
  }) {
    return _then(_value.copyWith(
      search_text: null == search_text
          ? _value.search_text
          : search_text // ignore: cast_nullable_to_non_nullable
              as String,
      list_value: null == list_value
          ? _value.list_value
          : list_value // ignore: cast_nullable_to_non_nullable
              as List<UnitModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitListStateImplCopyWith<$Res>
    implements $UnitListStateCopyWith<$Res> {
  factory _$$UnitListStateImplCopyWith(
          _$UnitListStateImpl value, $Res Function(_$UnitListStateImpl) then) =
      __$$UnitListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String search_text, List<UnitModel> list_value});
}

/// @nodoc
class __$$UnitListStateImplCopyWithImpl<$Res>
    extends _$UnitListStateCopyWithImpl<$Res, _$UnitListStateImpl>
    implements _$$UnitListStateImplCopyWith<$Res> {
  __$$UnitListStateImplCopyWithImpl(
      _$UnitListStateImpl _value, $Res Function(_$UnitListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search_text = null,
    Object? list_value = null,
  }) {
    return _then(_$UnitListStateImpl(
      search_text: null == search_text
          ? _value.search_text
          : search_text // ignore: cast_nullable_to_non_nullable
              as String,
      list_value: null == list_value
          ? _value._list_value
          : list_value // ignore: cast_nullable_to_non_nullable
              as List<UnitModel>,
    ));
  }
}

/// @nodoc

class _$UnitListStateImpl implements _UnitListState {
  const _$UnitListStateImpl(
      {this.search_text = '', final List<UnitModel> list_value = const []})
      : _list_value = list_value;

  @override
  @JsonKey()
  final String search_text;
  final List<UnitModel> _list_value;
  @override
  @JsonKey()
  List<UnitModel> get list_value {
    if (_list_value is EqualUnmodifiableListView) return _list_value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list_value);
  }

  @override
  String toString() {
    return 'UnitListState(search_text: $search_text, list_value: $list_value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitListStateImpl &&
            (identical(other.search_text, search_text) ||
                other.search_text == search_text) &&
            const DeepCollectionEquality()
                .equals(other._list_value, _list_value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search_text,
      const DeepCollectionEquality().hash(_list_value));

  /// Create a copy of UnitListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitListStateImplCopyWith<_$UnitListStateImpl> get copyWith =>
      __$$UnitListStateImplCopyWithImpl<_$UnitListStateImpl>(this, _$identity);
}

abstract class _UnitListState implements UnitListState {
  const factory _UnitListState(
      {final String search_text,
      final List<UnitModel> list_value}) = _$UnitListStateImpl;

  @override
  String get search_text;
  @override
  List<UnitModel> get list_value;

  /// Create a copy of UnitListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitListStateImplCopyWith<_$UnitListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
