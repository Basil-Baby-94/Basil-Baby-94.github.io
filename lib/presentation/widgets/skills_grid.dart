import 'package:basilbaby/core/app_constants.dart';
import 'package:basilbaby/models/skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SkillsGrid extends HookWidget {
  final List<Skill> skills;

  const SkillsGrid({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define the item width factor based on screen width
    double itemWidthFactor;
    if (screenWidth > 1200) {
      // Web
      itemWidthFactor = 0.13;
    } else if (screenWidth > 768) {
      // Tablet
      itemWidthFactor = 0.25;
    } else {
      // Mobile
      itemWidthFactor = 0.25;
    }

    final itemWidth = screenWidth * itemWidthFactor;
    final crossAxisCount = (screenWidth / itemWidth).floor();

    return GridView.builder(
      shrinkWrap: true, // Ensure the grid takes up only the necessary space
      itemCount: skills.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1, // Adjust aspect ratio as needed
      ),
      itemBuilder: (context, index) {
        final skill = skills[index];
        return SkillItem(skill: skill);
      },
    );
  }
}

class SkillItem extends HookWidget {
  final Skill skill;

  const SkillItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final isHovering = useState(false);

    return MouseRegion(
      onEnter: (_) {
        isHovering.value = true;
      },
      onExit: (_) {
        isHovering.value = false;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: isHovering.value
            ? const EdgeInsets.all(8) // Expanded padding on hover
            : const EdgeInsets.all(16), // Normal padding
        margin: EdgeInsets.symmetric(vertical: isHovering.value ? 4 : 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: !isHovering.value
              ? LinearGradient(
                  colors: [kPrimaryColor, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    kPrimaryColor.withOpacity(0.2),
                    kGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
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
  }
}
