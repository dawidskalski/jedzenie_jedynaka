part of 'dish_list_cubit.dart';

@freezed
class DishListState with _$DishListState {
  const factory DishListState({
    required List<MealModel> documents,
    required String errorMessage,
    required bool isLoading,
  }) = _DishListState;
}
