class MealModel {
  MealModel({
    required this.dishName,
    required this.description,
    required this.imgURL,
    required this.rating,
    required this.recip,
    required this.hour,
    required this.minute,
    required this.id,
  });
  final String id;
  final String dishName;
  final String description;
  final String imgURL;
  final String recip;
  final double rating;
  final int hour;
  final int minute;
}
