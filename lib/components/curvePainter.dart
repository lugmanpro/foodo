import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint();
    // paint.color = Color.fromRGBO(40, 67, 99, 1);
    // paint.style = PaintingStyle.fill;
    var path = Path();

    // path_1
    double path_1_xs = size.width / 414;
    double path_1_ys = size.height / 700;

    path
      ..moveTo(0 * path_1_xs, 50.24 * path_1_ys)
      ..cubicTo(0 * path_1_xs, 80.24 * path_1_ys, 103.3 * path_1_xs,
          0 * path_1_ys, 206.8 * path_1_xs, 0 * path_1_ys)
      ..cubicTo(310.3 * path_1_xs, 0 * path_1_ys, 414 * path_1_xs,
          80.24 * path_1_ys, 414 * path_1_xs, 50.24 * path_1_ys)
      ..lineTo(414 * path_1_xs, size.height)
      ..lineTo(0 * path_1_xs, size.height)
      ..lineTo(0 * path_1_xs, 73.24 * path_1_ys)
      ..close();

    path = path.shift(Offset(0 * path_1_xs, 465.76 * path_1_ys));

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
