// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/meal_repository.dart';
import 'package:jedzenie_jedynaka/app/features/home/dish_list/cubit/dish_list_cubit.dart';

class DishListPageContent extends StatelessWidget {
  const DishListPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DishListCubit(MealRepository())..start(),
      child: BlocBuilder<DishListCubit, DishListState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Text('Something went wrong ${state.errorMessage}');
          }
          if (state.isLoading) {
            return Center(child: const CircularProgressIndicator());
          }

          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (x) {
                            showDialog(
                              context: context,
                              builder: (build) => AlertDialog(
                                actions: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Text(
                                            'Czy chcesz usunąć ?',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<DishListCubit>()
                                                    .remove(document.id);

                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                              ),
                                              child: Text(
                                                'Tak',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                              ),
                                              child: Text(
                                                'Nie',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    child: DishesComponentWidget(
                        dishName: document.dishName,
                        recip: document.recip,
                        description: document.description,
                        rating: document.rating,
                        imgURL: document.imgURL,
                        hour: document.hour,
                        minute: document.minute),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}

// Widget który wyświetla kafalek z daniem
class DishesComponentWidget extends StatelessWidget {
  const DishesComponentWidget(
      {super.key,
      required this.dishName,
      required this.recip,
      required this.description,
      required this.hour,
      required this.minute,
      required this.rating,
      required this.imgURL});

  final String dishName;
  final String description;
  final String recip;
  final double rating;
  final int hour;
  final int minute;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black12,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  if (imgURL.isEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: AssetImage('images/avatar.jpg'),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (imgURL.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: NetworkImage(imgURL),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dishName,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.purple),
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (builder) => AlertDialog(
                                  actions: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            description,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 30),
                                          Text(
                                            recip,
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              'opis',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 27,
                            ),
                            SizedBox(width: 5),
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Colors.amber,
                              size: 27,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '$hour godz.   $minute min.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
