// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealModel {
  String get id => throw _privateConstructorUsedError;
  String get dishName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imgURL => throw _privateConstructorUsedError;
  String get recip => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealModelCopyWith<MealModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealModelCopyWith<$Res> {
  factory $MealModelCopyWith(MealModel value, $Res Function(MealModel) then) =
      _$MealModelCopyWithImpl<$Res, MealModel>;
  @useResult
  $Res call(
      {String id,
      String dishName,
      String description,
      String imgURL,
      String recip,
      double rating,
      int hour,
      int minute});
}

/// @nodoc
class _$MealModelCopyWithImpl<$Res, $Val extends MealModel>
    implements $MealModelCopyWith<$Res> {
  _$MealModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dishName = null,
    Object? description = null,
    Object? imgURL = null,
    Object? recip = null,
    Object? rating = null,
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dishName: null == dishName
          ? _value.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgURL: null == imgURL
          ? _value.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String,
      recip: null == recip
          ? _value.recip
          : recip // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealModelImplCopyWith<$Res>
    implements $MealModelCopyWith<$Res> {
  factory _$$MealModelImplCopyWith(
          _$MealModelImpl value, $Res Function(_$MealModelImpl) then) =
      __$$MealModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String dishName,
      String description,
      String imgURL,
      String recip,
      double rating,
      int hour,
      int minute});
}

/// @nodoc
class __$$MealModelImplCopyWithImpl<$Res>
    extends _$MealModelCopyWithImpl<$Res, _$MealModelImpl>
    implements _$$MealModelImplCopyWith<$Res> {
  __$$MealModelImplCopyWithImpl(
      _$MealModelImpl _value, $Res Function(_$MealModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dishName = null,
    Object? description = null,
    Object? imgURL = null,
    Object? recip = null,
    Object? rating = null,
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$MealModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dishName: null == dishName
          ? _value.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgURL: null == imgURL
          ? _value.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String,
      recip: null == recip
          ? _value.recip
          : recip // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MealModelImpl implements _MealModel {
  _$MealModelImpl(
      {required this.id,
      required this.dishName,
      required this.description,
      required this.imgURL,
      required this.recip,
      required this.rating,
      required this.hour,
      required this.minute});

  @override
  final String id;
  @override
  final String dishName;
  @override
  final String description;
  @override
  final String imgURL;
  @override
  final String recip;
  @override
  final double rating;
  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'MealModel(id: $id, dishName: $dishName, description: $description, imgURL: $imgURL, recip: $recip, rating: $rating, hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imgURL, imgURL) || other.imgURL == imgURL) &&
            (identical(other.recip, recip) || other.recip == recip) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, dishName, description,
      imgURL, recip, rating, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealModelImplCopyWith<_$MealModelImpl> get copyWith =>
      __$$MealModelImplCopyWithImpl<_$MealModelImpl>(this, _$identity);
}

abstract class _MealModel implements MealModel {
  factory _MealModel(
      {required final String id,
      required final String dishName,
      required final String description,
      required final String imgURL,
      required final String recip,
      required final double rating,
      required final int hour,
      required final int minute}) = _$MealModelImpl;

  @override
  String get id;
  @override
  String get dishName;
  @override
  String get description;
  @override
  String get imgURL;
  @override
  String get recip;
  @override
  double get rating;
  @override
  int get hour;
  @override
  int get minute;
  @override
  @JsonKey(ignore: true)
  _$$MealModelImplCopyWith<_$MealModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
