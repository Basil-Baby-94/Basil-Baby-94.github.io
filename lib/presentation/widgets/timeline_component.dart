import 'package:basilbaby/core/app_constants.dart';
import 'package:basilbaby/models/timeline.dart';
import 'package:basilbaby/presentation/widgets/branch_painter.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AnimatedGitCommitWidget extends HookWidget {
  final TimelineItem item;
  final TimelineItem? prevItem;
  final TimelineItem? nextItem;

  const AnimatedGitCommitWidget({
    super.key,
    required this.item,
    this.prevItem,
    this.nextItem,
  });

  @override
  Widget build(BuildContext context) {
    // Hook for managing visibility state
    final isVisible = useState(false);

    // Effect to handle delayed visibility
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        isVisible.value = true;
      });
      return null; // No cleanup needed
    }, []); // Empty dependencies array to run only once

    // Function to handle hover state
    void handleHover(bool hovering) {
      Provider.of<TimelineModel>(context, listen: false)
          .updateHoverState(item, hovering);
    }

    // Function to handle item selection
    void handleSelectItem() {
      Provider.of<TimelineModel>(context, listen: false).selectItem(item);
    }

    var isWideScreen = MediaQuery.of(context).size.width > 768;

    return AnimatedOpacity(
      opacity: isVisible.value ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedSlide(
        offset: isVisible.value ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        child: GestureDetector(
          onTap: !isWideScreen
              ? () {
                  if (item.skills.isNotEmpty ||
                      item.title == "India 🇮🇳 -> Sweden 🇸🇪") {
                    handleSelectItem();
                    context.go('/timeline/details');
                  }
                }
              : null,
          child: MouseRegion(
            onEnter: (_) => handleHover(true),
            // onExit: (_) =>
            //     handleHover(false), // Uncomment if hover exit is needed
            cursor: SystemMouseCursors.click,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  _buildBranches(),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: item.isHovering
                          ? const EdgeInsets.all(
                              24) // Expanded padding on hover
                          : const EdgeInsets.all(16), // Normal padding
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: item.isHovering
                            ? kGreen.shade400.withOpacity(0.4) // Hover color
                            : Colors.white.withAlpha(30), // Default color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.year} - ${item.title}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.subtitle,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 8),
                          Text(item.description),
                          if (item.isMerge || item.isBranchStart)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                item.isMerge
                                    ? 'Merged: ${item.branch} -> ${item.mergeTo}'
                                    : 'Branch created: ${item.branch}',
                                style: TextStyle(
                                  color: _getCommitColor(item.branch),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBranches() {
    return CustomPaint(
      size: const Size(80, double.infinity),
      painter: BranchPainter(
        currentItem: item,
        prevItem: prevItem,
        nextItem: nextItem,
      ),
    );
  }

  Color _getCommitColor(String branch) {
    switch (branch) {
      case 'main':
        return Colors.blue;
      case 'future/work':
        return kGreen;
      case 'future/study':
        return Colors.orange;
      default:
        return Colors.grey; // Default color for unknown branches
    }
  }
}
