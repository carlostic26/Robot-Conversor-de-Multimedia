import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    // Top border
    for (double i = borderRadius.topLeft.x;
        i < size.width - borderRadius.topRight.x;
        i += gap + strokeWidth) {
      double startX = i;
      double endX = i + gap;
      if (startX > borderRadius.topLeft.x &&
          endX < size.width - borderRadius.topRight.x) {
        path.moveTo(startX, 0);
        path.lineTo(endX, 0);
      }
    }

    // Right border
    for (double i = borderRadius.topRight.y;
        i < size.height - borderRadius.bottomRight.y;
        i += gap + strokeWidth) {
      double startY = i;
      double endY = i + gap;
      if (startY > borderRadius.topRight.y &&
          endY < size.height - borderRadius.bottomRight.y) {
        path.moveTo(size.width, startY);
        path.lineTo(size.width, endY);
      }
    }

    // Bottom border
    for (double i = size.width - borderRadius.bottomRight.x;
        i > borderRadius.bottomLeft.x;
        i -= gap + strokeWidth) {
      double startX = i;
      double endX = i - gap;
      if (startX < size.width - borderRadius.bottomRight.x &&
          endX > borderRadius.bottomLeft.x) {
        path.moveTo(startX, size.height);
        path.lineTo(endX, size.height);
      }
    }

    // Left border
    for (double i = size.height - borderRadius.bottomLeft.y;
        i > borderRadius.topLeft.y;
        i -= gap + strokeWidth) {
      double startY = i;
      double endY = i - gap;
      if (startY < size.height - borderRadius.bottomLeft.y &&
          endY > borderRadius.topLeft.y) {
        path.moveTo(0, startY);
        path.lineTo(0, endY);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
