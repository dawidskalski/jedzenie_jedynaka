import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit()
      : super(const AddState(
          errorMessage: '',
        ));

  Future<void> addDish({
    required String dishName,
    required String description,
    required String imgURL,
    required double rating,
    required String recip,
    required String time,
  }) async {
    try {
      FirebaseFirestore.instance.collection('dish').add({
        'dishName': dishName,
        'description': description,
        'imgURL': imgURL,
        'rating': rating,
        'recip': recip,
        'time': time,
      });
    } catch (error) {
      emit(
        AddState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
