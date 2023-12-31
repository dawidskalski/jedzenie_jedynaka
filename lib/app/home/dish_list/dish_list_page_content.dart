// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DishListPageContent extends StatelessWidget {
  const DishListPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('dish').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.hasError.toString()}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                DishesComponentWidget(
                  dishName: document['dishName'],
                  recip: document['recip'],
                  description: document['description'],
                  time: document['time'].toString(),
                  rating: document['rating'].toString(),
                ),
              ]
            ],
          );
        });
  }
}

class DishesComponentWidget extends StatelessWidget {
  const DishesComponentWidget({
    super.key,
    required this.dishName,
    required this.recip,
    required this.description,
    required this.time,
    required this.rating,
  });

  final String dishName;
  final String description;
  final String recip;
  final String rating;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Image border
                      child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset('images/avatar.jpg')),
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
                                      Text(
                                        description,
                                        style: TextStyle(fontSize: 17),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        recip,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'opis',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
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
      ),
    );
  }
}
