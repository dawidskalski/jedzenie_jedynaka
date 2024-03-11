import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jedzenie_jedynaka/app/domain/models/meal_model.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/meal_repository.dart';

part 'dish_list_state.dart';
part 'dish_list_cubit.freezed.dart';

class DishListCubit extends Cubit<DishListState> {
  DishListCubit(this._mealRepository)
      : super(const DishListState(
          documents: [],
          errorMessage: '',
          isLoading: true,
        ));

  final MealRepository _mealRepository;
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    _streamSubscription = _mealRepository.getItemsfromDateBase().listen(
      (event) {
        emit(
          DishListState(
            documents: event,
            errorMessage: '',
            isLoading: false,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            DishListState(
              documents: [],
              errorMessage: error.toString(),
              isLoading: false,
            ),
          );
        },
      );
  }

  Future<void> remove(documentID) async {
    _mealRepository.removePosition(documentID);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
