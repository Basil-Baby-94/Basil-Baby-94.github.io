import 'package:basilbaby/presentation/widgets/skills_grid.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TimelineDetailsScreen extends StatelessWidget {
  const TimelineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TimelineModel>(context);

    // Check if we're on the details route
    final bool isDetailsRoute = GoRouterState.of(context)
        .matchedLocation
        .startsWith('/timeline/details');

    var item = isDetailsRoute ? vm.selectedItem : vm.selectedHoveredItem;
    final isIndiaToSweden = item?.title == "India 🇮🇳 -> Sweden 🇸🇪";

    Widget buildDetailsContent() {
      return Column(
        children: [
          Expanded(flex: 1, child: Lottie.asset('assets/json/testing.json')),
          if (isIndiaToSweden)
            Expanded(
                flex: 1, child: Lottie.asset('assets/json/india_sweden.json')),
          if (!isIndiaToSweden && item != null)
            Expanded(flex: 1, child: SkillsGrid(skills: item.skills))
        ],
      );
    }

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildDetailsContent(),
    ));
  }
}
