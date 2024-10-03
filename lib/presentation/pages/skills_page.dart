import 'package:basilbaby/core/constants/strings.dart';
import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  SkillsPageState createState() => SkillsPageState();
}

class SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kSkills),
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
