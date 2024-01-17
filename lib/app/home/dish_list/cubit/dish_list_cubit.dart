import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'dish_list_state.dart';

class DishListCubit extends Cubit<DishListState> {
  DishListCubit()
      : super(DishListState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

//Wywoływnaie początkowej metody "start" podczas uruchamiania aplikacji.
  Future<void> start() async {
    emit(
      DishListState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('dish')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen(
      (event) {
        emit(
          DishListState(
            documents: event.docs,
            errorMessage: '',
            isLoading: false,
          ),
        );
      },
    )..onError((error) {
        emit(
          DishListState(
            documents: [],
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      });
  }

// Zamykanie subskrypcji kiedy wychodzimy z page
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}