import 'package:basilbaby/models/skill.dart';
import 'package:uuid/uuid.dart';

class TimelineItem {
  final String id;
  final String branch;
  final int year;
  final String title;
  final String subtitle;
  final String description;
  final bool isMerge;
  final bool isBranchStart;
  final String? mergeTo;
  final List<Skill> skills;
  final List<int> skillIndices;
  final String country;
  bool isHovering = false;
  bool isSelected = false;

  // Corrected constructor
  TimelineItem({
    String? id, // Make id optional
    required this.branch,
    required this.year,
    required this.title,
    required this.subtitle,
    required this.description,
    this.isMerge = false,
    this.isBranchStart = false,
    List<Skill>? skills, // Make skills optional
    List<int>? skillIndices,
    this.mergeTo,
    this.country = "🇮🇳", // Default to Indian flag
  })  : id = id ?? const Uuid().v4(), // Assign DateTime if id is null
        skills = skills ?? [],
        skillIndices = skillIndices ?? [];

  get isIndiaToSweden => null; // Initialize skills with empty list if null
}
