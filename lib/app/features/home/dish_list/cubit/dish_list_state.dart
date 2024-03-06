part of 'dish_list_cubit.dart';

@immutable
class DishListState {
  final List<MealModel> documents;
  final String errorMessage;
  final bool isLoading;

  const DishListState(
      {required this.documents,
      required this.errorMessage,
      required this.isLoading});
}
