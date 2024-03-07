import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/meal_repository.dart';
import 'package:meta/meta.dart';
part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._mealRepository)
      : super(const AddState(
          errorMessage: '',
        ));

  MealRepository _mealRepository;

  Future<void> addDish({
    required String dishName,
    required String description,
    required String imgURL,
    required double rating,
    required String recip,
    required int hour,
    required int minute,
  }) async {
    try {
      _mealRepository.addDishToDateBase(
        dishName: dishName,
        description: description,
        imgURL: imgURL,
        rating: rating,
        recip: recip,
        hour: hour,
        minute: minute,
      );
    } catch (error) {
      emit(
        AddState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
