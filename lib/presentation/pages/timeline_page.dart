import 'package:basilbaby/core/constants/strings.dart';
import 'package:basilbaby/presentation/pages/timeline_details.dart';
import 'package:basilbaby/presentation/widgets/timeline_component.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TimelineModel>(context);
    var timeline = vm.items.reversed.toList();
    var isWideScreen = MediaQuery.of(context).size.width > 768;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(kTimeline),
      // ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: timeline.length,
              itemBuilder: (context, index) {
                return AnimatedGitCommitWidget(
                  item: timeline[index],
                  nextItem: index > 0 ? timeline[index - 1] : null,
                  prevItem:
                      index < timeline.length - 1 ? timeline[index + 1] : null,
                );
              },
            ),
          ),
          if (isWideScreen) const Expanded(child: TimelineDetailsScreen())
        ],
      ),
    );
  }
}
