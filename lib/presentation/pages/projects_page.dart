import 'package:basilbaby/core/constants/strings.dart';
import 'package:basilbaby/models/project.dart';
import 'package:basilbaby/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  SkillsPageState createState() => SkillsPageState();
}

class SkillsPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kProjects),
      ),
      body: ResponsiveProjectGrid(projects: projects),
    );
  }
}

class ResponsiveProjectGrid extends HookWidget {
  final List<Project> projects;

  const ResponsiveProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width < 768;

    return LayoutBuilder(
      builder: (context, constraints) {
        return isTablet
            ? _buildListView(constraints)
            : _buildGridView(constraints);
      },
    );
  }

  Widget _buildListView(BoxConstraints constraints) {
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ProjectCard(project: projects[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGridView(BoxConstraints constraints) {
    final crossAxisCount = (constraints.maxWidth / 300).floor();
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: crossAxisCount,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: ProjectCard(project: projects[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
