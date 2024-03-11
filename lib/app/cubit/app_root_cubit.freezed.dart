// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_root_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppRootState {
  UserModel? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppRootStateCopyWith<AppRootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRootStateCopyWith<$Res> {
  factory $AppRootStateCopyWith(
          AppRootState value, $Res Function(AppRootState) then) =
      _$AppRootStateCopyWithImpl<$Res, AppRootState>;
  @useResult
  $Res call({UserModel? user, bool isLoading, String errorMessage});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AppRootStateCopyWithImpl<$Res, $Val extends AppRootState>
    implements $AppRootStateCopyWith<$Res> {
  _$AppRootStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppRootStateImplCopyWith<$Res>
    implements $AppRootStateCopyWith<$Res> {
  factory _$$AppRootStateImplCopyWith(
          _$AppRootStateImpl value, $Res Function(_$AppRootStateImpl) then) =
      __$$AppRootStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel? user, bool isLoading, String errorMessage});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AppRootStateImplCopyWithImpl<$Res>
    extends _$AppRootStateCopyWithImpl<$Res, _$AppRootStateImpl>
    implements _$$AppRootStateImplCopyWith<$Res> {
  __$$AppRootStateImplCopyWithImpl(
      _$AppRootStateImpl _value, $Res Function(_$AppRootStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$AppRootStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppRootStateImpl extends _AppRootState {
  const _$AppRootStateImpl(
      {required this.user, required this.isLoading, required this.errorMessage})
      : super._();

  @override
  final UserModel? user;
  @override
  final bool isLoading;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AppRootState(user: $user, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppRootStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppRootStateImplCopyWith<_$AppRootStateImpl> get copyWith =>
      __$$AppRootStateImplCopyWithImpl<_$AppRootStateImpl>(this, _$identity);
}

abstract class _AppRootState extends AppRootState {
  const factory _AppRootState(
      {required final UserModel? user,
      required final bool isLoading,
      required final String errorMessage}) = _$AppRootStateImpl;
  const _AppRootState._() : super._();

  @override
  UserModel? get user;
  @override
  bool get isLoading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AppRootStateImplCopyWith<_$AppRootStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
