import 'package:flutter/material.dart';
import 'package:hotelsgo/config/theme/palette.dart';
import 'package:hotelsgo/resources/spacing.dart';

class SearchTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()
      ..color = Palette.primaryColor
      ..style = PaintingStyle.fill;

    final stroke = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    Path fillPath = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width + Spacing.l40, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    Path strokePath = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width + Spacing.l40, size.height)
      ..close();

    canvas.drawPath(fillPath, fill);
    canvas.drawPath(strokePath, stroke);
  }

  @override
  bool shouldRepaint(SearchTextPainter oldDelegate) => false;
}
