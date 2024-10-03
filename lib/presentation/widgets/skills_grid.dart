import 'package:basilbaby/models/skill.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkillsGrid extends StatefulWidget {
  final List<Skill> skills;

  const SkillsGrid({super.key, required this.skills});

  @override
  SkillsGridState createState() => SkillsGridState();
}

class SkillsGridState extends State<SkillsGrid> {
  @override
  Widget build(BuildContext context) {
    final bool isTimelineRoute =
        GoRouterState.of(context).matchedLocation.startsWith('/timeline');
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    // Define the item width factor based on screen width
    double itemWidthFactor;
    if (screenWidth > 1200) {
      // Web
      itemWidthFactor = 0.1;
    } else if (screenWidth > 768) {
      // Tablet
      itemWidthFactor = 0.15;
    } else {
      // Mobile
      itemWidthFactor = 0.25;
    }
    var itemWidth = screenWidth * itemWidthFactor;
    if (isTimelineRoute) {
      itemWidth = screenWidth * 0.25;
    }

    // Calculate how many columns we can fit in the available screen width
    final crossAxisCount = (screenWidth / itemWidth).floor();

    return GridView.builder(
      shrinkWrap: true, // Ensure the grid takes up only the necessary space
      itemCount: widget.skills.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // Dynamically set based on screen width
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1, // Adjust aspect ratio as needed
      ),
      itemBuilder: (context, index) {
        final skill = widget.skills[index];
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              skill.isHovering = true;
            });
          },
          onExit: (_) {
            setState(() {
              skill.isHovering = false;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: skill.isHovering
                ? const EdgeInsets.all(8) // Expanded padding on hover
                : const EdgeInsets.all(16), // Normal padding
            margin: EdgeInsets.symmetric(vertical: skill.isHovering ? 4 : 8),
            decoration: BoxDecoration(
              // color: skill.isHovering
              //     ? Colors.green.shade400.withOpacity(0.8) // Hover color
              //     : Colors.white.withOpacity(0.6), // Default color
              borderRadius: BorderRadius.circular(10),
              gradient: !skill.isHovering
                  ? LinearGradient(
                      colors: [Colors.green.shade400, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [
                        Colors.green.shade400.withOpacity(0.2),
                        Colors.green,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ), // Only show gradient on hover
            ),
            child: Center(
              child: Text(
                skill.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white, // Text color to contrast gradient
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
