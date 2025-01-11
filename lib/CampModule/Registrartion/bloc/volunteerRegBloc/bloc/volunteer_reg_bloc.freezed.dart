// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_reg_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VolunteerRegEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)
        volunteerReg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)?
        volunteerReg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)?
        volunteerReg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CampList value) volunteerReg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CampList value)? volunteerReg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CampList value)? volunteerReg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteerRegEventCopyWith<$Res> {
  factory $VolunteerRegEventCopyWith(
          VolunteerRegEvent value, $Res Function(VolunteerRegEvent) then) =
      _$VolunteerRegEventCopyWithImpl<$Res, VolunteerRegEvent>;
}

/// @nodoc
class _$VolunteerRegEventCopyWithImpl<$Res, $Val extends VolunteerRegEvent>
    implements $VolunteerRegEventCopyWith<$Res> {
  _$VolunteerRegEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VolunteerRegEvent
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
    extends _$VolunteerRegEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolunteerRegEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VolunteerRegEvent.started()';
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
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)
        volunteerReg,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)?
        volunteerReg,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)?
        volunteerReg,
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
    required TResult Function(_CampList value) volunteerReg,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CampList value)? volunteerReg,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CampList value)? volunteerReg,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VolunteerRegEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CampListImplCopyWith<$Res> {
  factory _$$CampListImplCopyWith(
          _$CampListImpl value, $Res Function(_$CampListImpl) then) =
      __$$CampListImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String district,
      String aadhaar,
      String address,
      String chooseCamp,
      String email,
      String name,
      String password,
      String phoneNumber,
      String skillsExp});
}

/// @nodoc
class __$$CampListImplCopyWithImpl<$Res>
    extends _$VolunteerRegEventCopyWithImpl<$Res, _$CampListImpl>
    implements _$$CampListImplCopyWith<$Res> {
  __$$CampListImplCopyWithImpl(
      _$CampListImpl _value, $Res Function(_$CampListImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolunteerRegEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? district = null,
    Object? aadhaar = null,
    Object? address = null,
    Object? chooseCamp = null,
    Object? email = null,
    Object? name = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? skillsExp = null,
  }) {
    return _then(_$CampListImpl(
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      aadhaar: null == aadhaar
          ? _value.aadhaar
          : aadhaar // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      chooseCamp: null == chooseCamp
          ? _value.chooseCamp
          : chooseCamp // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      skillsExp: null == skillsExp
          ? _value.skillsExp
          : skillsExp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CampListImpl implements _CampList {
  const _$CampListImpl(
      {required this.district,
      required this.aadhaar,
      required this.address,
      required this.chooseCamp,
      required this.email,
      required this.name,
      required this.password,
      required this.phoneNumber,
      required this.skillsExp});

  @override
  final String district;
  @override
  final String aadhaar;
  @override
  final String address;
  @override
  final String chooseCamp;
  @override
  final String email;
  @override
  final String name;
  @override
  final String password;
  @override
  final String phoneNumber;
  @override
  final String skillsExp;

  @override
  String toString() {
    return 'VolunteerRegEvent.volunteerReg(district: $district, aadhaar: $aadhaar, address: $address, chooseCamp: $chooseCamp, email: $email, name: $name, password: $password, phoneNumber: $phoneNumber, skillsExp: $skillsExp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampListImpl &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.aadhaar, aadhaar) || other.aadhaar == aadhaar) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.chooseCamp, chooseCamp) ||
                other.chooseCamp == chooseCamp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.skillsExp, skillsExp) ||
                other.skillsExp == skillsExp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, district, aadhaar, address,
      chooseCamp, email, name, password, phoneNumber, skillsExp);

  /// Create a copy of VolunteerRegEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampListImplCopyWith<_$CampListImpl> get copyWith =>
      __$$CampListImplCopyWithImpl<_$CampListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)
        volunteerReg,
  }) {
    return volunteerReg(district, aadhaar, address, chooseCamp, email, name,
        password, phoneNumber, skillsExp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)?
        volunteerReg,
  }) {
    return volunteerReg?.call(district, aadhaar, address, chooseCamp, email,
        name, password, phoneNumber, skillsExp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String district,
            String aadhaar,
            String address,
            String chooseCamp,
            String email,
            String name,
            String password,
            String phoneNumber,
            String skillsExp)?
        volunteerReg,
    required TResult orElse(),
  }) {
    if (volunteerReg != null) {
      return volunteerReg(district, aadhaar, address, chooseCamp, email, name,
          password, phoneNumber, skillsExp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CampList value) volunteerReg,
  }) {
    return volunteerReg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CampList value)? volunteerReg,
  }) {
    return volunteerReg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CampList value)? volunteerReg,
    required TResult orElse(),
  }) {
    if (volunteerReg != null) {
      return volunteerReg(this);
    }
    return orElse();
  }
}

abstract class _CampList implements VolunteerRegEvent {
  const factory _CampList(
      {required final String district,
      required final String aadhaar,
      required final String address,
      required final String chooseCamp,
      required final String email,
      required final String name,
      required final String password,
      required final String phoneNumber,
      required final String skillsExp}) = _$CampListImpl;

  String get district;
  String get aadhaar;
  String get address;
  String get chooseCamp;
  String get email;
  String get name;
  String get password;
  String get phoneNumber;
  String get skillsExp;

  /// Create a copy of VolunteerRegEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampListImplCopyWith<_$CampListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VolunteerRegState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loding,
    required TResult Function(String error) error,
    required TResult Function(VolunteerModel response) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(VolunteerModel response)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(VolunteerModel response)? success,
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
abstract class $VolunteerRegStateCopyWith<$Res> {
  factory $VolunteerRegStateCopyWith(
          VolunteerRegState value, $Res Function(VolunteerRegState) then) =
      _$VolunteerRegStateCopyWithImpl<$Res, VolunteerRegState>;
}

/// @nodoc
class _$VolunteerRegStateCopyWithImpl<$Res, $Val extends VolunteerRegState>
    implements $VolunteerRegStateCopyWith<$Res> {
  _$VolunteerRegStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VolunteerRegState
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
    extends _$VolunteerRegStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolunteerRegState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VolunteerRegState.initial()';
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
    required TResult Function(VolunteerModel response) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(VolunteerModel response)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(VolunteerModel response)? success,
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

abstract class _Initial implements VolunteerRegState {
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
    extends _$VolunteerRegStateCopyWithImpl<$Res, _$LodingImpl>
    implements _$$LodingImplCopyWith<$Res> {
  __$$LodingImplCopyWithImpl(
      _$LodingImpl _value, $Res Function(_$LodingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolunteerRegState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LodingImpl implements _Loding {
  const _$LodingImpl();

  @override
  String toString() {
    return 'VolunteerRegState.loding()';
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
    required TResult Function(VolunteerModel response) success,
  }) {
    return loding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(VolunteerModel response)? success,
  }) {
    return loding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(VolunteerModel response)? success,
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

abstract class _Loding implements VolunteerRegState {
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
    extends _$VolunteerRegStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolunteerRegState
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
    return 'VolunteerRegState.error(error: $error)';
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

  /// Create a copy of VolunteerRegState
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
    required TResult Function(VolunteerModel response) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(VolunteerModel response)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(VolunteerModel response)? success,
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

abstract class _Error implements VolunteerRegState {
  const factory _Error({required final String error}) = _$ErrorImpl;

  String get error;

  /// Create a copy of VolunteerRegState
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
  $Res call({VolunteerModel response});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$VolunteerRegStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolunteerRegState
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
              as VolunteerModel,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.response});

  @override
  final VolunteerModel response;

  @override
  String toString() {
    return 'VolunteerRegState.success(response: $response)';
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

  /// Create a copy of VolunteerRegState
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
    required TResult Function(VolunteerModel response) success,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loding,
    TResult? Function(String error)? error,
    TResult? Function(VolunteerModel response)? success,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loding,
    TResult Function(String error)? error,
    TResult Function(VolunteerModel response)? success,
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

abstract class _Success implements VolunteerRegState {
  const factory _Success({required final VolunteerModel response}) =
      _$SuccessImpl;

  VolunteerModel get response;

  /// Create a copy of VolunteerRegState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
