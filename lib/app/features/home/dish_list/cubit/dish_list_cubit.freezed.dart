// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DishListState {
  List<MealModel> get documents => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DishListStateCopyWith<DishListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishListStateCopyWith<$Res> {
  factory $DishListStateCopyWith(
          DishListState value, $Res Function(DishListState) then) =
      _$DishListStateCopyWithImpl<$Res, DishListState>;
  @useResult
  $Res call({List<MealModel> documents, String errorMessage, bool isLoading});
}

/// @nodoc
class _$DishListStateCopyWithImpl<$Res, $Val extends DishListState>
    implements $DishListStateCopyWith<$Res> {
  _$DishListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? errorMessage = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<MealModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishListStateImplCopyWith<$Res>
    implements $DishListStateCopyWith<$Res> {
  factory _$$DishListStateImplCopyWith(
          _$DishListStateImpl value, $Res Function(_$DishListStateImpl) then) =
      __$$DishListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MealModel> documents, String errorMessage, bool isLoading});
}

/// @nodoc
class __$$DishListStateImplCopyWithImpl<$Res>
    extends _$DishListStateCopyWithImpl<$Res, _$DishListStateImpl>
    implements _$$DishListStateImplCopyWith<$Res> {
  __$$DishListStateImplCopyWithImpl(
      _$DishListStateImpl _value, $Res Function(_$DishListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
    Object? errorMessage = null,
    Object? isLoading = null,
  }) {
    return _then(_$DishListStateImpl(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<MealModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DishListStateImpl implements _DishListState {
  const _$DishListStateImpl(
      {required final List<MealModel> documents,
      required this.errorMessage,
      required this.isLoading})
      : _documents = documents;

  final List<MealModel> _documents;
  @override
  List<MealModel> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final String errorMessage;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'DishListState(documents: $documents, errorMessage: $errorMessage, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_documents), errorMessage, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishListStateImplCopyWith<_$DishListStateImpl> get copyWith =>
      __$$DishListStateImplCopyWithImpl<_$DishListStateImpl>(this, _$identity);
}

abstract class _DishListState implements DishListState {
  const factory _DishListState(
      {required final List<MealModel> documents,
      required final String errorMessage,
      required final bool isLoading}) = _$DishListStateImpl;

  @override
  List<MealModel> get documents;
  @override
  String get errorMessage;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$DishListStateImplCopyWith<_$DishListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
