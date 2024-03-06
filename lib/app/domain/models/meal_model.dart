class MealModel {
  MealModel({
    required this.dishName,
    required this.description,
    required this.imgURL,
    required this.rating,
    required this.recip,
    required this.time,
    required this.id,
  });
  final String id;
  final String dishName;
  final String description;
  final String imgURL;
  final double rating;
  final String recip;
  final String time;
}
