import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  var hour = 0;
  var minute = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Ustaw czas przyrządzania',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) {
                      hour = value;
                    },
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (buildContext, index) {
                        return MyHours(hours: index);
                      },
                    ),
                  ),
                ),
                const Text(
                  'godz.',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(width: 35),
                SizedBox(
                  width: 50,
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (value) {
                      minute = value;
                    },
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (buildContext, index) {
                        return MyMinutes(
                          min: index,
                        );
                      },
                    ),
                  ),
                ),
                const Text(
                  'min.',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                
                Navigator.of(context).pop((hour, minute));
                
              },
              child: const Text('Dodaj'),
            ),
          )
        ],
      ),
    );
  }
}

class MyMinutes extends StatelessWidget {
  const MyMinutes({super.key, required this.min});

  final int min;

  @override
  Widget build(BuildContext context) {
    return Text(
      min.toString(),
      style: const TextStyle(
        fontSize: 40,
        color: Colors.white,
      ),
    );
  }
}

class MyHours extends StatelessWidget {
  const MyHours({super.key, required this.hours});

  final int hours;

  @override
  Widget build(BuildContext context) {
    return Text(
      hours.toString(),
      style: const TextStyle(
        fontSize: 40,
        color: Colors.white,
      ),
    );
  }
}

