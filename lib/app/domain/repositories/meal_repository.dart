import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jedzenie_jedynaka/app/domain/models/meal_model.dart';

class MealRepository {
  Stream<List<MealModel>> getItemsfromDateBase() {
    return FirebaseFirestore.instance
        .collection('dish')
        .orderBy('rating', descending: true)
        .snapshots()
        .map((event) {
      return event.docs
          .map(
            (e) => MealModel(
              id: e.id,
              dishName: e['dishName'],
              description: e['description'],
              imgURL: e['imgURL'],
              rating: e['rating'],
              recip: e['recip'],
              hour: e['hour'],
              minute: e['minute'],
            ),
          )
          .toList();
    });
  }

  Future<void> removePosition(documentID) async {
    FirebaseFirestore.instance.collection('dish').doc(documentID).delete();
  }

  Future<void> addDishToDateBase({
    required String dishName,
    required String description,
    required String imgURL,
    required double rating,
    required String recip,
    required int hour,
    required int minute,
  }) async {
    FirebaseFirestore.instance.collection('dish').add({
      'dishName': dishName,
      'description': description,
      'imgURL': imgURL,
      'rating': rating,
      'recip': recip,
      'hour': hour,
      'minute': minute,
    });
  }
}
