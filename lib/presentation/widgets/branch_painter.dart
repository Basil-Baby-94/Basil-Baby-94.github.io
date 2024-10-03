import 'package:basilbaby/models/timeline.dart';
import 'package:flutter/material.dart';

class BranchPainter extends CustomPainter {
  final TimelineItem currentItem;
  final TimelineItem? prevItem;
  final TimelineItem? nextItem;
  late Size _size;

  BranchPainter({
    required this.currentItem,
    this.prevItem,
    this.nextItem,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _size = size;

    final Paint mainLinePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1;

    final Paint featureWorkLinePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1;

    final Paint featureMscLinePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 1;

    final double mainLineX = size.width / 4;
    final double featureWorkLineX = 1.6 * size.width / 4;
    final double featureMscLineX = 2.2 * size.width / 4;

    // Draw main line
    canvas.drawLine(
      Offset(mainLineX, 0),
      Offset(mainLineX, size.height),
      mainLinePaint,
    );

    // Draw future/work line if needed
    if (_shouldDrawFeatureWorkLine()) {
      canvas.drawLine(
        Offset(featureWorkLineX,
            currentItem.isBranchStart ? (size.height / 2) : (size.height)),
        Offset(featureWorkLineX, currentItem.isMerge ? (size.height / 2) : 0),
        featureWorkLinePaint,
      );
    }

    // Draw future/study line if needed
    if (_shouldDrawFeatureMscLine()) {
      canvas.drawLine(
        Offset(featureMscLineX,
            currentItem.isBranchStart ? (size.height / 2) : (size.height)),
        Offset(featureMscLineX, currentItem.isMerge ? (size.height / 2) : 0),
        featureMscLinePaint,
      );
    }

    // Determine the color for the commit circle based on the branch
    final Color commitColor = _getCommitColor(currentItem.branch);
    // Draw commit circle
    final commitX = _getCommitX(currentItem.branch);
    canvas.drawCircle(
      Offset(commitX, size.height / 2),
      5,
      Paint()..color = commitColor,
    );

    // Draw branch start or merge lines
    if (currentItem.isBranchStart) {
      final fromX = _getCommitX('main');
      final toX = _getCommitX(currentItem.branch);
      canvas.drawLine(
        Offset(fromX, size.height / 1.5),
        Offset(toX, size.height / 2),
        currentItem.branch == 'future/study'
            ? featureMscLinePaint
            : featureWorkLinePaint,
      );
    } else if (currentItem.isMerge) {
      final fromX = _getCommitX(currentItem.branch);
      final toX = _getCommitX(currentItem.mergeTo ?? 'main');
      canvas.drawLine(
        Offset(fromX, size.height / 2),
        Offset(toX, size.height / 3),
        currentItem.branch == 'future/study'
            ? featureMscLinePaint
            : featureWorkLinePaint,
      );
    }
  }

  bool _shouldDrawFeatureWorkLine() {
    return currentItem.branch == 'future/work';
  }

  bool _shouldDrawFeatureMscLine() {
    return currentItem.branch == 'future/study';
  }

  double _getCommitX(String branch) {
    switch (branch) {
      case 'main':
        return _size.width / 4;
      case 'future/work':
        return 1.6 * _size.width / 4;
      case 'future/study':
        return 2.2 * _size.width / 4;
      default:
        return _size.width / 4;
    }
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
