import 'package:flutter/material.dart';
import 'dart:math' as math;

class Particle {
  Offset position;

  Particle(this.position);
}

class BackgroundPainter extends CustomPainter {
  final List<Particle> particles;
  final Offset mousePosition;
  final Animation<double> animation;
  final double zoomRadius = 100.0;
  final double zoomFactor = 1.5;

  BackgroundPainter({
    required this.particles,
    required this.mousePosition,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (var particle in particles) {
      for (var otherParticle in particles) {
        if (particle != otherParticle) {
          double distance =
              (particle.position - otherParticle.position).distance;
          if (distance < 200) {
            _drawZoomedLine(
                canvas, paint, particle.position, otherParticle.position, size);

            // Add animated particles along the line
            int particleCount = (distance / 15).floor();
            for (int i = 0; i < particleCount; i++) {
              double t = i / particleCount;
              Offset particlePos =
                  Offset.lerp(particle.position, otherParticle.position, t)!;
              double particleSize = 2 *
                  (math.sin(t * math.pi + (animation.value * 2 * math.pi)) + 1);
              _drawZoomedCircle(canvas, paint, particlePos, particleSize, size);
            }
          }
        }
      }
    }

    // Draw particles
    paint.color = Colors.yellowAccent.withOpacity(0.2);
    for (var particle in particles) {
      _drawZoomedCircle(canvas, paint, particle.position, 3, size);
    }
  }

  void _drawZoomedLine(
      Canvas canvas, Paint paint, Offset start, Offset end, Size size) {
    Offset zoomedStart = _applyZoom(start, size);
    Offset zoomedEnd = _applyZoom(end, size);
    canvas.drawLine(zoomedStart, zoomedEnd, paint);
  }

  void _drawZoomedCircle(
      Canvas canvas, Paint paint, Offset center, double radius, Size size) {
    Offset zoomedCenter = _applyZoom(center, size);
    double zoomedRadius = _applyZoomToRadius(center, radius, size);
    canvas.drawCircle(zoomedCenter, zoomedRadius, paint);
  }

  Offset _applyZoom(Offset position, Size size) {
    double distanceToMouse = (position - mousePosition).distance;
    if (distanceToMouse < zoomRadius) {
      double zoomStrength = 1 - (distanceToMouse / zoomRadius);
      Offset vectorToMouse = mousePosition - position;
      return position + (vectorToMouse * zoomStrength * (zoomFactor - 1));
    }
    return position;
  }

  double _applyZoomToRadius(Offset position, double radius, Size size) {
    double distanceToMouse = (position - mousePosition).distance;
    if (distanceToMouse < zoomRadius) {
      double zoomStrength = 1 - (distanceToMouse / zoomRadius);
      return radius * (1 + zoomStrength * (zoomFactor - 1));
    }
    return radius;
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) {
    return true;
  }
}

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  AnimatedBackgroundState createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Particle> particles = [];
  Offset mousePosition = Offset.zero;
  Size? _lastSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateParticles();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateMousePosition(PointerEvent details) {
    setState(() {
      mousePosition = details.localPosition;
    });
  }

  void _updateParticles() {
    final size = MediaQuery.of(context).size;
    if (_lastSize != size) {
      setState(() {
        particles = generateUniqueParticles(size, size.width > 768 ? 200 : 100);
        _lastSize = size;
      });
    }
  }

  List<Particle> generateUniqueParticles(Size size, int particleCount) {
    final List<Offset> possiblePositions = [];

    for (double x = 0; x < size.width; x += 20) {
      for (double y = 0; y < size.height; y += 20) {
        possiblePositions.add(Offset(x, y));
      }
    }

    possiblePositions.shuffle(math.Random());

    return possiblePositions
        .take(particleCount)
        .map((offset) => Particle(offset))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateParticles();
        });
        return MouseRegion(
          onHover: _updateMousePosition,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: BackgroundPainter(
                  particles: particles,
                  mousePosition: mousePosition,
                  animation: _controller,
                ),
                size: Size(constraints.maxWidth, constraints.maxHeight),
                child: child,
              );
            },
            child: widget.child,
          ),
        );
      },
    );
  }
}
