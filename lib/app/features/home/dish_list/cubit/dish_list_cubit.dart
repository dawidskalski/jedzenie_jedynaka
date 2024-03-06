import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:jedzenie_jedynaka/app/domain/models/meal_model.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/meal_repository.dart';
import 'package:meta/meta.dart';

part 'dish_list_state.dart';

class DishListCubit extends Cubit<DishListState> {
  DishListCubit(this._mealRepository)
      : super(const DishListState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final MealRepository _mealRepository;
  StreamSubscription? _streamSubscription;

//Wywoływnaie początkowej metody "start" podczas uruchamiania aplikacji.
  Future<void> start() async {
    emit(
      const DishListState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

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
    )..onError((error) {
        emit(
          DishListState(
            documents: const [],
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      });
  }

  Future<void> remove(documentID) async {
    _mealRepository.removePosition(documentID);
  }

// Zamykanie subskrypcji kiedy wychodzimy z page
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
