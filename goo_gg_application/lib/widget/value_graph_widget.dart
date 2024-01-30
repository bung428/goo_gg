import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math';

import 'package:flutter/material.dart';

class BarChartPainter extends CustomPainter {
  final Color barColor;
  final List<double> data;
  final List<ui.Image?> labels;
  final double bottomPadding = 10.0; // x축 레이블 영역
  final double leftPadding = 50.0;

  List<double> labelHeight = [];
  double textScaleFactorXAxis = 1.0;
  double textScaleFactorYAxis = 1.2;

  BarChartPainter({
    required this.barColor,
    required this.data,
    required this.labels
  });

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> coordinates = getCoordinates(size);

    drawYLabel(canvas, size, coordinates);
  }

  void drawXLabel(Canvas canvas, Size size, List<Offset> coordinates) {
    final maxValue = data.reduce((v, e) => v > e ? v : e).floor().toString();
    final fontSize = calculateFontSize(maxValue, size, xAxis: false);
    final graphWidth = size.width - leftPadding;
    final graphHeight = size.height - bottomPadding;

    for (int i=0; i<data.length; i++) {
      final offset = coordinates[i];

      final tp = TextPainter(
        text: TextSpan(
          text: '${data[i]}',
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout(minWidth: 0, maxWidth: leftPadding);
      final textWidth = tp.width;
      final barWidth = offset.dx;
      final margin = (graphHeight / data.length - bottomPadding) / 6;
      final barHeight = (graphHeight / data.length - bottomPadding) - margin;
      if (barWidth >= graphWidth || barWidth + textWidth >= graphWidth) {
        tp.paint(canvas, Offset(graphWidth, offset.dy + (barHeight / 6)));
      } else {
        tp.paint(canvas, Offset(leftPadding + barWidth + 8, offset.dy + (barHeight / 6)));
      }
    }
  }

  Future<void> drawYLabel(Canvas canvas, Size size, List<Offset> coordinates) async {
    final double graphHeight = size.height - bottomPadding;
    for (int i = 0; i < labels.length; i++) {
      final margin = (graphHeight / data.length - bottomPadding) / 6;
      final barHeight = (graphHeight / data.length - bottomPadding) - margin;
      final labelY = barHeight / 2 + (coordinates[i].dy);
      labelHeight.add(labelY);

      final image = labels[i];
      if (image == null) {
        canvas.drawRect(
          Rect.fromCenter(
            center: Offset(0, labelY),
            width: barHeight,
            height: barHeight
          ),
          Paint()
        );
      } else {
        paintImage(
          canvas: canvas,
          rect: Rect.fromCenter(
            center: Offset(16, labelY),
            width: leftPadding - 16,
            height: leftPadding - 16
          ),
          image: image,
          fit: BoxFit.contain
        );
      }
    }

    if (labelHeight.isNotEmpty) {
      drawBar(canvas, size, coordinates);
      drawXLabel(canvas, size, coordinates);
    }
  }

  void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {
    final double graphHeight = size.height - bottomPadding;

    Paint paint = Paint()
      ..color = barColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < data.length; i++) {
      Offset offset = coordinates[i];
      final margin = (graphHeight / data.length - bottomPadding) / 6;
      final barHeight = (graphHeight / data.length - bottomPadding) - margin;
      canvas.drawRect(
        Rect.fromLTRB(
          leftPadding,
          offset.dy,
          leftPadding + offset.dx,
          offset.dy + barHeight
        ),
        paint,
      );
    }
  }

  double calculateFontSize(String value, Size size, {required bool xAxis}) {
    int numberOfCharacters = value.length;
    double fontSize = size.width / (numberOfCharacters *  data.length);

    if (xAxis) {
      fontSize *= textScaleFactorXAxis;
    } else {
      fontSize *= textScaleFactorYAxis;
    }

    return fontSize;
  }

  List<Offset> getCoordinates(Size size) {
    List<Offset> coordinates = [];

    double maxData = data.reduce((value, element) => value > element ? value : element);

    double graphHeight = size.height - bottomPadding;
    double minBarHeight = graphHeight / labels.length;

    for (var index = 0; index < labels.length; index++) {
      double top = minBarHeight * index + bottomPadding;

      double normalized = data[index] / maxData;
      double graphWidth = size.width - leftPadding;
      double barWidth = normalized * graphWidth;

      Offset offset = Offset(barWidth, top);
      coordinates.add(offset);
    }

    return coordinates;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
