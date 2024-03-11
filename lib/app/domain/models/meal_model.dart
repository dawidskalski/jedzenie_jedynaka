import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_model.freezed.dart';

@freezed
class MealModel with _$MealModel {
  factory MealModel({
    required String id,
    required String dishName,
    required String description,
    required String imgURL,
    required String recip,
    required double rating,
    required int hour,
    required int minute,
  }) = _MealModel;
}
