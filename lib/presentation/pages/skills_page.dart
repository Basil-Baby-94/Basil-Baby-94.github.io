import 'package:basilbaby/core/app_constants.dart';
import 'package:basilbaby/core/constants/strings.dart';
import 'package:basilbaby/presentation/widgets/skills_background.dart';
import 'package:basilbaby/presentation/widgets/skills_grid.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class SkillsPage extends HookWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TimelineModel>(context);

    // Manage the search query using useState
    final searchQuery = useState('');

    // Get all unique skills and filter them by the search query
    final filteredSkills = vm.items
        .expand((item) => item.skills)
        .toSet()
        .where((skill) => skill.title.toLowerCase().contains(
            searchQuery.value.toLowerCase())) // Filter by search query
        .toList();

    bool isDesktop() {
      if (kIsWeb &&
          (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android)) {
        return false;
      } else {
        return true;
      }
    }

    Widget mainContent() {
      return Column(
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
                    // Update the search query when the user types in the search bar
                    searchQuery.value = value;
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset:
                                    Offset(1.0, 1.0), // Position of the shadow
                                blurRadius: 4.0, // Blur effect for the shadow
                                color: kGreen, // Shadow color
                              ),
                            ],
                          ),
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
      );
    }

    Widget bodyContent() {
      if (isDesktop()) {
        return AnimatedBackground(child: mainContent());
      } else {
        return mainContent();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(kSkills),
      ),
      body: bodyContent(),
    );
  }
}
