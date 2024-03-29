// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DishListPageContent extends StatelessWidget {
  const DishListPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('dish')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.hasError.toString()}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }

          final documents = snapshot.data!.docs;
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
                                                FirebaseFirestore.instance
                                                    .collection('dish')
                                                    .doc(document.id)
                                                    .delete();

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
                      dishName: document['dishName'],
                      recip: document['recip'],
                      description: document['description'],
                      time: document['time'],
                      rating: document['rating'].toString(),
                      imgURL: document['imgURL'],
                    ),
                  ),
                ),
              ]
            ],
          );
        });
  }
}

// Widget który wyświetla kafalek z daniem
class DishesComponentWidget extends StatelessWidget {
  const DishesComponentWidget(
      {super.key,
      required this.dishName,
      required this.recip,
      required this.description,
      required this.time,
      required this.rating,
      required this.imgURL});

  final String dishName;
  final String description;
  final String recip;
  final String rating;
  final String time;
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
                              rating,
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
                              '$time min',
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
