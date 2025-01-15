// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_enter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockEnterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)
        stockenter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)?
        stockenter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)?
        stockenter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Stockenter value) stockenter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Stockenter value)? stockenter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Stockenter value)? stockenter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockEnterEventCopyWith<$Res> {
  factory $StockEnterEventCopyWith(
          StockEnterEvent value, $Res Function(StockEnterEvent) then) =
      _$StockEnterEventCopyWithImpl<$Res, StockEnterEvent>;
}

/// @nodoc
class _$StockEnterEventCopyWithImpl<$Res, $Val extends StockEnterEvent>
    implements $StockEnterEventCopyWith<$Res> {
  _$StockEnterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockEnterEvent
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
    extends _$StockEnterEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEnterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'StockEnterEvent.started()';
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
    required TResult Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)
        stockenter,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)?
        stockenter,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)?
        stockenter,
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
    required TResult Function(_Started value) started,
    required TResult Function(_Stockenter value) stockenter,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Stockenter value)? stockenter,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Stockenter value)? stockenter,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements StockEnterEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$StockenterImplCopyWith<$Res> {
  factory _$$StockenterImplCopyWith(
          _$StockenterImpl value, $Res Function(_$StockenterImpl) then) =
      __$$StockenterImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String item_name,
      String clothing_size,
      String clothing_gender,
      String color,
      String fabric_type,
      String quantity,
      String item_category});
}

/// @nodoc
class __$$StockenterImplCopyWithImpl<$Res>
    extends _$StockEnterEventCopyWithImpl<$Res, _$StockenterImpl>
    implements _$$StockenterImplCopyWith<$Res> {
  __$$StockenterImplCopyWithImpl(
      _$StockenterImpl _value, $Res Function(_$StockenterImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEnterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_name = null,
    Object? clothing_size = null,
    Object? clothing_gender = null,
    Object? color = null,
    Object? fabric_type = null,
    Object? quantity = null,
    Object? item_category = null,
  }) {
    return _then(_$StockenterImpl(
      item_name: null == item_name
          ? _value.item_name
          : item_name // ignore: cast_nullable_to_non_nullable
              as String,
      clothing_size: null == clothing_size
          ? _value.clothing_size
          : clothing_size // ignore: cast_nullable_to_non_nullable
              as String,
      clothing_gender: null == clothing_gender
          ? _value.clothing_gender
          : clothing_gender // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      fabric_type: null == fabric_type
          ? _value.fabric_type
          : fabric_type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      item_category: null == item_category
          ? _value.item_category
          : item_category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StockenterImpl implements _Stockenter {
  const _$StockenterImpl(
      {required this.item_name,
      required this.clothing_size,
      required this.clothing_gender,
      required this.color,
      required this.fabric_type,
      required this.quantity,
      required this.item_category});

  @override
  final String item_name;
  @override
  final String clothing_size;
  @override
  final String clothing_gender;
  @override
  final String color;
  @override
  final String fabric_type;
  @override
  final String quantity;
  @override
  final String item_category;

  @override
  String toString() {
    return 'StockEnterEvent.stockenter(item_name: $item_name, clothing_size: $clothing_size, clothing_gender: $clothing_gender, color: $color, fabric_type: $fabric_type, quantity: $quantity, item_category: $item_category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockenterImpl &&
            (identical(other.item_name, item_name) ||
                other.item_name == item_name) &&
            (identical(other.clothing_size, clothing_size) ||
                other.clothing_size == clothing_size) &&
            (identical(other.clothing_gender, clothing_gender) ||
                other.clothing_gender == clothing_gender) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.fabric_type, fabric_type) ||
                other.fabric_type == fabric_type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.item_category, item_category) ||
                other.item_category == item_category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item_name, clothing_size,
      clothing_gender, color, fabric_type, quantity, item_category);

  /// Create a copy of StockEnterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockenterImplCopyWith<_$StockenterImpl> get copyWith =>
      __$$StockenterImplCopyWithImpl<_$StockenterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)
        stockenter,
  }) {
    return stockenter(item_name, clothing_size, clothing_gender, color,
        fabric_type, quantity, item_category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)?
        stockenter,
  }) {
    return stockenter?.call(item_name, clothing_size, clothing_gender, color,
        fabric_type, quantity, item_category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String item_name,
            String clothing_size,
            String clothing_gender,
            String color,
            String fabric_type,
            String quantity,
            String item_category)?
        stockenter,
    required TResult orElse(),
  }) {
    if (stockenter != null) {
      return stockenter(item_name, clothing_size, clothing_gender, color,
          fabric_type, quantity, item_category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Stockenter value) stockenter,
  }) {
    return stockenter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Stockenter value)? stockenter,
  }) {
    return stockenter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Stockenter value)? stockenter,
    required TResult orElse(),
  }) {
    if (stockenter != null) {
      return stockenter(this);
    }
    return orElse();
  }
}

abstract class _Stockenter implements StockEnterEvent {
  const factory _Stockenter(
      {required final String item_name,
      required final String clothing_size,
      required final String clothing_gender,
      required final String color,
      required final String fabric_type,
      required final String quantity,
      required final String item_category}) = _$StockenterImpl;

  String get item_name;
  String get clothing_size;
  String get clothing_gender;
  String get color;
  String get fabric_type;
  String get quantity;
  String get item_category;

  /// Create a copy of StockEnterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockenterImplCopyWith<_$StockenterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockEnterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(StockEnterModel response) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(StockEnterModel response)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(StockEnterModel response)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockEnterStateCopyWith<$Res> {
  factory $StockEnterStateCopyWith(
          StockEnterState value, $Res Function(StockEnterState) then) =
      _$StockEnterStateCopyWithImpl<$Res, StockEnterState>;
}

/// @nodoc
class _$StockEnterStateCopyWithImpl<$Res, $Val extends StockEnterState>
    implements $StockEnterStateCopyWith<$Res> {
  _$StockEnterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StockEnterStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'StockEnterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(StockEnterModel response) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(StockEnterModel response)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(StockEnterModel response)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements StockEnterState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LodingImplCopyWith<$Res> {
  factory _$$LodingImplCopyWith(
          _$LodingImpl value, $Res Function(_$LodingImpl) then) =
      __$$LodingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LodingImplCopyWithImpl<$Res>
    extends _$StockEnterStateCopyWithImpl<$Res, _$LodingImpl>
    implements _$$LodingImplCopyWith<$Res> {
  __$$LodingImplCopyWithImpl(
      _$LodingImpl _value, $Res Function(_$LodingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LodingImpl implements _Loding {
  const _$LodingImpl();

  @override
  String toString() {
    return 'StockEnterState.loding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LodingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(StockEnterModel response) success,
  }) {
    return loding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(StockEnterModel response)? success,
  }) {
    return loding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(StockEnterModel response)? success,
    required TResult orElse(),
  }) {
    if (loding != null) {
      return loding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loding != null) {
      return loding(this);
    }
    return orElse();
  }
}

abstract class _Loding implements StockEnterState {
  const factory _Loding() = _$LodingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$StockEnterStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'StockEnterState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(StockEnterModel response) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(StockEnterModel response)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(StockEnterModel response)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements StockEnterState {
  const factory _Error({required final String error}) = _$ErrorImpl;

  String get error;

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StockEnterModel response});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$StockEnterStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as StockEnterModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.response});

  @override
  final StockEnterModel response;

  @override
  String toString() {
    return 'StockEnterState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(StockEnterModel response) success,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(StockEnterModel response)? success,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(StockEnterModel response)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loding,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loding,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loding,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements StockEnterState {
  const factory _Success({required final StockEnterModel response}) =
      _$SuccessImpl;

  StockEnterModel get response;

  /// Create a copy of StockEnterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
