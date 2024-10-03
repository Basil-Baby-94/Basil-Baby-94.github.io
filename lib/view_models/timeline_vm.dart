import 'package:basilbaby/models/skill.dart';
import 'package:basilbaby/models/timeline.dart';
import 'package:flutter/material.dart';

class TimelineModel extends ChangeNotifier {
  final List<TimelineItem> _items = [
    TimelineItem(
      branch: 'main',
      year: 2011,
      title: 'B.Sc. Electronics 🇮🇳',
      subtitle: 'Mahatma Gandhi University',
      description:
          'Studied electronics, embedded systems, and communication technologies.',
      skills: [
        Skill(title: 'Digital Electronics'),
        Skill(title: 'Microcontrollers'),
        Skill(title: 'Signal Processing'),
        Skill(title: 'Communication Systems'),
        Skill(title: 'Electronic Instrumentation'),
        Skill(title: 'Mathematics for Electronics'),
        Skill(title: 'Basic Electronics'),
      ],
    ),
    TimelineItem(
      branch: 'main',
      year: 2014,
      title: 'M.Sc. Applied Electronics 🇮🇳',
      subtitle: 'Barathiyar University',
      description:
          'Specialized in advanced electronics, circuit design, and automation.',
      skills: [
        Skill(title: 'Advanced Circuit Design'),
        Skill(title: 'Power Electronics'),
        Skill(title: 'Microcontroller and Microprocessor Systems'),
        Skill(title: 'Control Systems'),
        Skill(title: 'Digital Signal Processing (DSP)'),
        Skill(title: 'Embedded Systems Development'),
        Skill(title: 'Analog and Digital Communication Systems'),
        Skill(title: 'Semiconductor Devices and VLSI'),
        Skill(title: 'Advanced Instrumentation Techniques'),
        Skill(title: 'Renewable Energy Systems'),
        Skill(title: 'Applied Mathematics for Electronics'),
        Skill(title: 'Project Management and Research Methodology'),
        Skill(title: 'Raspberry Pi'),
      ],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2016,
      title: 'Service Engineer 🇮🇳',
      subtitle: 'Nisa Eye',
      description:
          "Installed and configured CCTV and sensor systems, led troubleshooting efforts, and applied critical thinking to resolve complex issues while managing a team and ensuring smooth operations.",
      isBranchStart: true,
      skills: [
        Skill(title: 'CCTV Installation'),
        Skill(title: 'Sensors Installation'),
        Skill(title: 'Problem Solving'),
        Skill(title: 'Critical Thinking'),
      ],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2017,
      title: 'Supervisor 🇮🇳',
      subtitle: 'Hi-Tech',
      description:
          'Developed machine operating skills, managed a team, handled troubleshooting and maintenance.',
      skills: [
        Skill(title: 'Team Management'),
        Skill(title: 'Troubleshooting'),
        Skill(title: 'Machine Operation'),
        Skill(title: 'Bobcat Operation'),
        Skill(title: 'Tally'),
      ],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2018,
      title: 'Software Engineer 🇮🇳',
      subtitle: 'Phenomtec Solutions PVT LTD',
      description:
          'Focused on mobile app development, cloud services, and IoT integration.',
      skills: [
        Skill(title: 'Swift Programming'),
        Skill(title: 'Xcode IDE Proficiency'),
        Skill(title: 'iOS SDK and Frameworks'),
        Skill(title: 'User Interface (UI) Design with UIKit and SwiftUI'),
      ],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2018,
      title: 'Software Engineer 🇮🇳',
      subtitle: 'Qbler Technolabs PVT LTD',
      description:
          'Involved in end-to-end project development, from requirement analysis to implementation.',
      skills: [
        Skill(title: 'Cloud Services'),
        Skill(title: 'Swift Programming'),
        Skill(title: 'Xcode IDE Proficiency'),
        Skill(title: 'iOS SDK and Frameworks'),
        Skill(title: 'RESTful APIs and Networking'),
        Skill(title: 'Version Control with Git'),
        Skill(title: 'Debugging and Performance Optimization'),
        Skill(title: 'Autolayout and Interface Builder'),
        Skill(title: 'App Architecture (MVC, MVVM)'),
        Skill(title: 'Core Animation and Graphics'),
      ],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2020,
      title: 'Software Engineer 🇮🇳',
      subtitle: 'Dexlock Technologies LLP',
      description:
          'Involved in end-to-end project development, from requirement analysis to implementation.',
      skills: [
        // Programming Languages
        Skill(title: 'Swift'),
        Skill(title: 'Dart'),
        Skill(title: 'Java'),
        Skill(title: 'Kotlin'),
        Skill(title: 'Python'),

// Mobile Development
        Skill(title: 'iOS Development'),
        Skill(title: 'Flutter'),
        Skill(title: 'Android Development'),

// IoT & Hardware
        Skill(title: 'IoT'),
        Skill(title: 'Raspberry Pi'),
        Skill(title: 'Bluetooth'),

// Data Formats & APIs
        Skill(title: 'JSON'),
        Skill(title: 'Restful APIs'),

// Cloud & Backend Services
        Skill(title: 'Firebase'),
        Skill(title: 'Cloud Services'),

// Software Development
        Skill(title: 'Software Development'),
        Skill(title: 'Git'),
        Skill(title: 'MVVM'),
        Skill(title: 'MVC'),
        Skill(title: 'Agile Methodologies'),
        Skill(title: 'CI/CD'),

// Development Tools & IDEs
        Skill(title: 'Xcode'),
        Skill(title: 'Android Studio'),
        Skill(title: 'VS Code'),
        Skill(title: 'IntelliJ'),
      ],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2022,
      title: 'Merge: Work Experience',
      subtitle: 'future/work -> main',
      description: 'Merging work experience into main education timeline.',
      isMerge: true,
      mergeTo: 'main',
      skills: [],
    ),
    TimelineItem(
      branch: 'main',
      year: 2022,
      title: 'India 🇮🇳 -> Sweden 🇸🇪',
      subtitle: '',
      description: 'Moved from India to Sweden for higher studies.',
      skills: [],
    ),
    TimelineItem(
      branch: 'future/study',
      year: 2022,
      title: 'M.Sc. Electronics Engineering 🇸🇪',
      subtitle: 'Linköping University',
      description:
          "With advanced studies in electronics, I started a second Master's degree to enhance my skills in IoT and IC design.",
      isBranchStart: true,
      skills: [
        Skill(title: 'Advanced Circuit Design and Simulation'),
        Skill(title: 'Embedded Systems Design and Development'),
        Skill(title: 'Signal Processing and Control Systems'),
        Skill(title: 'Analog and Digital Circuit Design'),
        Skill(title: 'Power Electronics and Energy Systems'),
        Skill(title: 'IoT and Sensor Networks'),
        Skill(title: 'PCB Design and Fabrication'),
        Skill(title: 'Wireless Communication Systems'),
        Skill(title: 'Advanced Semiconductor Devices'),
        Skill(title: 'Robust Systems Design'),
        Skill(title: 'Project Management and Research Methodologies'),
        Skill(title: 'Mathematics for Electronics Engineering'),
        //# EDA Tools and Simulation
        Skill(title: 'Cadence Virtuoso'),
        Skill(title: 'Cadence Spectre'),
        Skill(title: 'Cadence Virtuoso Layout Editor'),
        //# VLSI & Hardware Description Languages
        Skill(title: 'VLSI'),
        Skill(title: 'Verilog'),
        Skill(title: 'VHDL'),
        Skill(title: 'CMOS Design'),
        //# Programming Languages
        Skill(title: 'Python'),
        Skill(title: 'C++'),

        //# Operating Systems and Tools
        Skill(title: 'Linux'),
        Skill(title: 'Git'),

        //# Simulation and Modeling
        Skill(title: 'Matlab/Simulink'),
      ],
    ),
    TimelineItem(
      branch: 'future/study',
      year: 2024,
      title: 'Thesis at Ericsson 🇸🇪',
      subtitle: 'Ericsson AB',
      description:
          "6-month thesis project at Ericsson as part of Master's. program.",
      skills: [
        //# EDA Tools and Simulation
        Skill(title: 'Cadence Virtuoso'),
        Skill(title: 'Cadence Spectre'),
        Skill(title: 'Cadence Virtuoso Layout Editor'),
        Skill(title: 'Python'),
      ],
    ),
    TimelineItem(
      branch: 'future/study',
      year: 2024,
      title: 'Merge: Masters in Electronics',
      subtitle: 'future/study -> main',
      description:
          "Merging my Master's in Electronics and software skills into my educational timeline.",
      isMerge: true,
      mergeTo: 'main',
      skills: [],
    ),
    TimelineItem(
      branch: 'future/work',
      year: 2024,
      title: 'iOS Developer 🇸🇪',
      subtitle: 'XR Solutions',
      description:
          'Developing iOS applications, working with Swift and Xcode to deliver scalable solutions.',
      isBranchStart: true,
      skills: [
        Skill(title: 'Xcode'),
        Skill(title: 'Git'),
        Skill(title: 'MVVM'),
        Skill(title: 'AWS'),
        Skill(title: 'AR Objects'),
        Skill(title: 'SwiftUI'),
      ],
    ),
  ];

  List<TimelineItem> get items => _items;

  // Getter to retrieve the currently selected item
  TimelineItem? get selectedItem {
    // Return null if no item is selected
    for (var item in items) {
      if (item.isSelected) {
        return item;
      }
    }
    return null; // Return null if no item is found
  }

  TimelineItem? get selectedHoveredItem {
    // Return null if no item is selected
    for (var item in items) {
      if (item.isHovering) {
        return item;
      }
    }
    return null; // Return null if no item is found
  }

  void updateHoverState(TimelineItem item, bool isHovered) {
    // Iterate through all items in the _items list
    for (var timelineItem in _items) {
      // Set isHovering to true for the hovered item, false for all others
      if (timelineItem.id == item.id) {
        timelineItem.isHovering = isHovered;
      } else {
        timelineItem.isHovering = false;
      }
    }
    // Notify listeners of the state change
    notifyListeners();
  }

  void selectItem(TimelineItem selectedItem) {
    // Iterate through all items and set their isSelected flag
    for (var item in _items) {
      if (item.id == selectedItem.id) {
        item.isSelected = true;
      } else {
        item.isSelected = false;
      }
      // item.isSelected = item == selectedItem; // Select only the selectedItem
    }
  }
}
