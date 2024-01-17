part of 'dish_list_cubit.dart';

@immutable
class DishListState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final String errorMessage;
  final bool isLoading;

  DishListState(
      {required this.documents,
      required this.errorMessage,
      required this.isLoading});
}
