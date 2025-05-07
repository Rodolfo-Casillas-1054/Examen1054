import 'package:flutter/material.dart';

class MiListWheelScrollView extends StatefulWidget {
  const MiListWheelScrollView({Key? key}) : super(key: key);

  @override
  _MiListWheelScrollViewState createState() => _MiListWheelScrollViewState();
}

class _MiListWheelScrollViewState extends State<MiListWheelScrollView> {
  int currentHour = 0;
  int currentMinute = 0;
  bool isAM = true;

  final FixedExtentScrollController hourController =
      FixedExtentScrollController();
  final FixedExtentScrollController minuteController =
      FixedExtentScrollController();
  final FixedExtentScrollController ampmController =
      FixedExtentScrollController();

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    ampmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hours wheel
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: hourController,
                onSelectedItemChanged: (value) {
                  setState(() {
                    currentHour = value;
                  });
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 13,
                  builder: (context, index) {
                    return MyHours(hours: index);
                  },
                ),
              ),
            ),

            // Colon separator
            const SizedBox(width: 10),
            const Text(
              ':',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),

            // Minutes wheel
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: minuteController,
                onSelectedItemChanged: (value) {
                  setState(() {
                    currentMinute = value;
                  });
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 60,
                  builder: (context, index) {
                    return MyMinutes(minutes: index);
                  },
                ),
              ),
            ),

            const SizedBox(width: 10),

            // AM/PM wheel
            SizedBox(
              width: 70,
              child: ListWheelScrollView.useDelegate(
                controller: ampmController,
                onSelectedItemChanged: (index) {
                  setState(() {
                    isAM = index == 0;
                  });
                },
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 2,
                  builder: (context, index) {
                    return MyAMPM(isItAM: index == 0);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for MyHours widget
class MyHours extends StatelessWidget {
  final int hours;
  const MyHours({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        hours.toString().padLeft(2, '0'),
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}

// Placeholder for MyMinutes widget
class MyMinutes extends StatelessWidget {
  final int minutes;
  const MyMinutes({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        minutes.toString().padLeft(2, '0'),
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}

// Placeholder for MyAMPM widget
class MyAMPM extends StatelessWidget {
  final bool isItAM;
  const MyAMPM({super.key, required this.isItAM});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isItAM ? 'AM' : 'PM',
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
