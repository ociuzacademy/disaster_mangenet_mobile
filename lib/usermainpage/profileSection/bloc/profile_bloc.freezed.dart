// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String utype) profileFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String utype)? profileFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String utype)? profileFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProfileFetch value) profileFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProfileFetch value)? profileFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProfileFetch value)? profileFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
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
    extends _$ProfileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ProfileEvent.started()';
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
    required TResult Function(String utype) profileFetch,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String utype)? profileFetch,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String utype)? profileFetch,
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
    required TResult Function(_ProfileFetch value) profileFetch,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProfileFetch value)? profileFetch,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProfileFetch value)? profileFetch,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProfileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ProfileFetchImplCopyWith<$Res> {
  factory _$$ProfileFetchImplCopyWith(
          _$ProfileFetchImpl value, $Res Function(_$ProfileFetchImpl) then) =
      __$$ProfileFetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String utype});
}

/// @nodoc
class __$$ProfileFetchImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileFetchImpl>
    implements _$$ProfileFetchImplCopyWith<$Res> {
  __$$ProfileFetchImplCopyWithImpl(
      _$ProfileFetchImpl _value, $Res Function(_$ProfileFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utype = null,
  }) {
    return _then(_$ProfileFetchImpl(
      utype: null == utype
          ? _value.utype
          : utype // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileFetchImpl implements _ProfileFetch {
  const _$ProfileFetchImpl({required this.utype});

  @override
  final String utype;

  @override
  String toString() {
    return 'ProfileEvent.profileFetch(utype: $utype)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileFetchImpl &&
            (identical(other.utype, utype) || other.utype == utype));
  }

  @override
  int get hashCode => Object.hash(runtimeType, utype);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileFetchImplCopyWith<_$ProfileFetchImpl> get copyWith =>
      __$$ProfileFetchImplCopyWithImpl<_$ProfileFetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String utype) profileFetch,
  }) {
    return profileFetch(utype);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String utype)? profileFetch,
  }) {
    return profileFetch?.call(utype);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String utype)? profileFetch,
    required TResult orElse(),
  }) {
    if (profileFetch != null) {
      return profileFetch(utype);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProfileFetch value) profileFetch,
  }) {
    return profileFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProfileFetch value)? profileFetch,
  }) {
    return profileFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProfileFetch value)? profileFetch,
    required TResult orElse(),
  }) {
    if (profileFetch != null) {
      return profileFetch(this);
    }
    return orElse();
  }
}

abstract class _ProfileFetch implements ProfileEvent {
  const factory _ProfileFetch({required final String utype}) =
      _$ProfileFetchImpl;

  String get utype;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileFetchImplCopyWith<_$ProfileFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
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
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState.initial()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
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
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res, _$LodingImpl>
    implements _$$LodingImplCopyWith<$Res> {
  __$$LodingImplCopyWithImpl(
      _$LodingImpl _value, $Res Function(_$LodingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LodingImpl implements _Loding {
  const _$LodingImpl();

  @override
  String toString() {
    return 'ProfileState.loading()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loding implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
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
    return 'ProfileState.error(error: $error)';
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

  /// Create a copy of ProfileState
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
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
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProfileState {
  const factory _Error({required final String error}) = _$ErrorImpl;

  String get error;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersuccessImplCopyWith<$Res> {
  factory _$$UsersuccessImplCopyWith(
          _$UsersuccessImpl value, $Res Function(_$UsersuccessImpl) then) =
      __$$UsersuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileModel response});
}

/// @nodoc
class __$$UsersuccessImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$UsersuccessImpl>
    implements _$$UsersuccessImplCopyWith<$Res> {
  __$$UsersuccessImplCopyWithImpl(
      _$UsersuccessImpl _value, $Res Function(_$UsersuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$UsersuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
    ));
  }
}

/// @nodoc

class _$UsersuccessImpl implements _Usersuccess {
  const _$UsersuccessImpl({required this.response});

  @override
  final UserProfileModel response;

  @override
  String toString() {
    return 'ProfileState.usersuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersuccessImplCopyWith<_$UsersuccessImpl> get copyWith =>
      __$$UsersuccessImplCopyWithImpl<_$UsersuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) {
    return usersuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) {
    return usersuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (usersuccess != null) {
      return usersuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) {
    return usersuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) {
    return usersuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (usersuccess != null) {
      return usersuccess(this);
    }
    return orElse();
  }
}

abstract class _Usersuccess implements ProfileState {
  const factory _Usersuccess({required final UserProfileModel response}) =
      _$UsersuccessImpl;

  UserProfileModel get response;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersuccessImplCopyWith<_$UsersuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VolunteerSuccessImplCopyWith<$Res> {
  factory _$$VolunteerSuccessImplCopyWith(_$VolunteerSuccessImpl value,
          $Res Function(_$VolunteerSuccessImpl) then) =
      __$$VolunteerSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileModel response});
}

/// @nodoc
class __$$VolunteerSuccessImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$VolunteerSuccessImpl>
    implements _$$VolunteerSuccessImplCopyWith<$Res> {
  __$$VolunteerSuccessImplCopyWithImpl(_$VolunteerSuccessImpl _value,
      $Res Function(_$VolunteerSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$VolunteerSuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
    ));
  }
}

/// @nodoc

class _$VolunteerSuccessImpl implements _VolunteerSuccess {
  const _$VolunteerSuccessImpl({required this.response});

  @override
  final UserProfileModel response;

  @override
  String toString() {
    return 'ProfileState.volunteerSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolunteerSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VolunteerSuccessImplCopyWith<_$VolunteerSuccessImpl> get copyWith =>
      __$$VolunteerSuccessImplCopyWithImpl<_$VolunteerSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) {
    return volunteerSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) {
    return volunteerSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (volunteerSuccess != null) {
      return volunteerSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) {
    return volunteerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) {
    return volunteerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (volunteerSuccess != null) {
      return volunteerSuccess(this);
    }
    return orElse();
  }
}

abstract class _VolunteerSuccess implements ProfileState {
  const factory _VolunteerSuccess({required final UserProfileModel response}) =
      _$VolunteerSuccessImpl;

  UserProfileModel get response;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VolunteerSuccessImplCopyWith<_$VolunteerSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionVolentiSuccessImplCopyWith<$Res> {
  factory _$$CollectionVolentiSuccessImplCopyWith(
          _$CollectionVolentiSuccessImpl value,
          $Res Function(_$CollectionVolentiSuccessImpl) then) =
      __$$CollectionVolentiSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileModel response});
}

/// @nodoc
class __$$CollectionVolentiSuccessImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$CollectionVolentiSuccessImpl>
    implements _$$CollectionVolentiSuccessImplCopyWith<$Res> {
  __$$CollectionVolentiSuccessImplCopyWithImpl(
      _$CollectionVolentiSuccessImpl _value,
      $Res Function(_$CollectionVolentiSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$CollectionVolentiSuccessImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
    ));
  }
}

/// @nodoc

class _$CollectionVolentiSuccessImpl implements _CollectionVolentiSuccess {
  const _$CollectionVolentiSuccessImpl({required this.response});

  @override
  final UserProfileModel response;

  @override
  String toString() {
    return 'ProfileState.collectionVolentiSuccess(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionVolentiSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionVolentiSuccessImplCopyWith<_$CollectionVolentiSuccessImpl>
      get copyWith => __$$CollectionVolentiSuccessImplCopyWithImpl<
          _$CollectionVolentiSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(UserProfileModel response) usersuccess,
    required TResult Function(UserProfileModel response) volunteerSuccess,
    required TResult Function(UserProfileModel response)
        collectionVolentiSuccess,
  }) {
    return collectionVolentiSuccess(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(UserProfileModel response)? usersuccess,
    TResult? Function(UserProfileModel response)? volunteerSuccess,
    TResult? Function(UserProfileModel response)? collectionVolentiSuccess,
  }) {
    return collectionVolentiSuccess?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(UserProfileModel response)? usersuccess,
    TResult Function(UserProfileModel response)? volunteerSuccess,
    TResult Function(UserProfileModel response)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (collectionVolentiSuccess != null) {
      return collectionVolentiSuccess(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loding value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Usersuccess value) usersuccess,
    required TResult Function(_VolunteerSuccess value) volunteerSuccess,
    required TResult Function(_CollectionVolentiSuccess value)
        collectionVolentiSuccess,
  }) {
    return collectionVolentiSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loding value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Usersuccess value)? usersuccess,
    TResult? Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult? Function(_CollectionVolentiSuccess value)?
        collectionVolentiSuccess,
  }) {
    return collectionVolentiSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loding value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Usersuccess value)? usersuccess,
    TResult Function(_VolunteerSuccess value)? volunteerSuccess,
    TResult Function(_CollectionVolentiSuccess value)? collectionVolentiSuccess,
    required TResult orElse(),
  }) {
    if (collectionVolentiSuccess != null) {
      return collectionVolentiSuccess(this);
    }
    return orElse();
  }
}

abstract class _CollectionVolentiSuccess implements ProfileState {
  const factory _CollectionVolentiSuccess(
          {required final UserProfileModel response}) =
      _$CollectionVolentiSuccessImpl;

  UserProfileModel get response;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionVolentiSuccessImplCopyWith<_$CollectionVolentiSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
