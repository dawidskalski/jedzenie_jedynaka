import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPageContent extends StatefulWidget {
  const AddPageContent({
    super.key,
  });

  @override
  State<AddPageContent> createState() => _AddPageContentState();
}

class _AddPageContentState extends State<AddPageContent> {
  var rating = 0.0;
  var dishNameController = TextEditingController();
  var recipController = TextEditingController();
  var descriptionController = TextEditingController();

  TimeOfDay? currentSelectedTime;
  String formatTimeOfDay(TimeOfDay timeOfDay) {
    return timeOfDay.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                    height: 210,
                    color: Colors.amber,
                    child: const Image(image: AssetImage('images/avatar.jpg'))),
                const SizedBox(height: 15),
                TextField(
                  controller: dishNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      label: const Text('Nazwa')),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: descriptionController,
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    label: const Text('Opis'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: recipController,
                  minLines: 1,
                  maxLines: 4,
                  decoration: InputDecoration(
                    label: const Text('Przepisz'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    final selectedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());

                    setState(() {
                      currentSelectedTime = selectedTime;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            currentSelectedTime == null
                                ? 'przygotowanie zajmuje'
                                : formatTimeOfDay(currentSelectedTime!),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.schedule,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Slider(
                        value: rating,
                        min: 0.0,
                        max: 5.0,
                        divisions: 10,
                        onChanged: (currentValue) {
                          setState(() {
                            rating = currentValue;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          size: 27,
                          color: Colors.amber,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('dish').add({
                      'dishName': dishNameController.text,
                      'description': descriptionController.text,
                      'recip': recipController.text,
                      'time': formatTimeOfDay(currentSelectedTime!).toString(),
                      'rating': rating
                    });
                    dishNameController.clear();
                    descriptionController.clear();
                    recipController.clear();
                    setState(() {
                      currentSelectedTime = null;
                      rating = 0;
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text(
                    'Dodaj',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
