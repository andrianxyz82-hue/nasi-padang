import 'package:flutter/material.dart';

class NeonDot {
  final double x;
  final double y;
  final double radius;
  final Color color;
  final double opacity;

  NeonDot({
    required this.x,
    required this.y,
    required this.radius,
    required this.color,
    required this.opacity,
  });
}

class NeonBackgroundPainter extends CustomPainter {
  final List<NeonDot> dots;

  NeonBackgroundPainter({required this.dots});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw Waves
    final path = Path();
    // Wave 1 (Purple)
    paint.color = const Color(0xFFB042FF).withOpacity(0.3);
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.25,
      size.width * 0.5, size.height * 0.35,
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.45,
      size.width, size.height * 0.3,
    );
    canvas.drawPath(path, paint);

    // Wave 2 (Blue/Cyan)
    final path2 = Path();
    paint.color = const Color(0xFF42E0FF).withOpacity(0.3);
    path2.moveTo(0, size.height * 0.35);
    path2.quadraticBezierTo(
      size.width * 0.25, size.height * 0.45,
      size.width * 0.5, size.height * 0.3,
    );
    path2.quadraticBezierTo(
      size.width * 0.75, size.height * 0.2,
      size.width, size.height * 0.35,
    );
    canvas.drawPath(path2, paint);

    // Draw Neon Dots
    final dotPaint = Paint()..style = PaintingStyle.fill;

    for (final dot in dots) {
      dotPaint.color = dot.color.withOpacity(dot.opacity);
      canvas.drawCircle(
        Offset(dot.x * size.width, dot.y * size.height),
        dot.radius,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
