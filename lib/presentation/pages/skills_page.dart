import 'package:basilbaby/core/app_constants.dart';
import 'package:basilbaby/core/constants/strings.dart';
import 'package:basilbaby/presentation/widgets/skills_background.dart';
import 'package:basilbaby/presentation/widgets/skills_grid.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  SkillsPageState createState() => SkillsPageState();
}

class SkillsPageState extends State<SkillsPage> {
  String searchQuery = ''; // To store the search query

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TimelineModel>(context);

    // Get all unique skills and filter them by the search query
    final filteredSkills = vm.items
        .expand((item) => item.skills)
        .toSet()
        .where((skill) => skill.title
            .toLowerCase()
            .contains(searchQuery.toLowerCase())) // Filter by search query
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(kSkills),
      ),
      body: AnimatedBackground(
        child: Column(
          children: [
            // Search bar at the top
            MouseRegion(
              cursor: SystemMouseCursors
                  .text, // Set the cursor to text when hovering over the search bar
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                  child: TextField(
                    cursorColor: kPrimaryColor.withOpacity(0.4),
                    decoration: const InputDecoration(
                      labelText: kSearchSkills,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: filteredSkills.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .mood_bad, // Choose an icon that fits your message
                            size: 48.0, // Adjust size as needed
                            color: kGreen, // Icon color
                          ),
                          SizedBox(height: 16.0), // Space between icon and text
                          Text(
                            kSearchEmptyMessage,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              // backgroundColor:
                              //     kPrimaryColor.withOpacity(0.2),
                              shadows: [
                                Shadow(
                                  offset: Offset(
                                      1.0, 1.0), // Position of the shadow
                                  blurRadius: 4.0, // Blur effect for the shadow
                                  color: kGreen, // Shadow color
                                ),
                              ],
                            ), // Customize the style as needed
                            textAlign: TextAlign
                                .center, // Center the text for better visibility
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SkillsGrid(
                        skills:
                            filteredSkills, // Pass the filtered skills to the grid
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
