import 'package:basilbaby/models/timeline.dart';
import 'package:basilbaby/presentation/widgets/branch_painter.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AnimatedGitCommitWidget extends StatefulWidget {
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
  AnimatedGitCommitWidgetState createState() => AnimatedGitCommitWidgetState();
}

class AnimatedGitCommitWidgetState extends State<AnimatedGitCommitWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  void _handleHover(bool hovering) {
    Provider.of<TimelineModel>(context, listen: false)
        .updateHoverState(widget.item, hovering);
  }

  void _handleSelectItem() {
    Provider.of<TimelineModel>(context, listen: false).selectItem(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    var isWideScreen = MediaQuery.of(context).size.width > 768;
    final item = widget.item;
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedSlide(
        offset: _isVisible ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        child: GestureDetector(
          onTap: !isWideScreen
              ? () {
                  _handleSelectItem();
                  context.go('/timeline/details');
                }
              : null,
          child: MouseRegion(
            onEnter: (_) => _handleHover(true),
            // onExit: (_) => _handleHover(false),
            cursor: SystemMouseCursors.click, // Change the mouse pointer
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
                            ? Colors.green.shade400
                                .withOpacity(0.4) // Hover color
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
        currentItem: widget.item,
        prevItem: widget.prevItem,
        nextItem: widget.nextItem,
      ),
    );
  }

  Color _getCommitColor(String branch) {
    switch (branch) {
      case 'main':
        return Colors.blue;
      case 'future/work':
        return Colors.green;
      case 'future/study':
        return Colors.orange;
      default:
        return Colors.grey; // Default color for unknown branches
    }
  }
}
