import 'package:basilbaby/core/constants/strings.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  TimelinePageState createState() => TimelinePageState();
}

class TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kTimeline),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.hourglass_empty,
            ),
            SizedBox(height: 20),
            Text(
              'Working in Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please check back later!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
