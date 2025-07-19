import 'package:flutter/material.dart';

double getMenueWidth(List<String> texts, TextStyle style) {
  final TextPainter painter = TextPainter(textDirection: TextDirection.rtl);

  double maxWidth = 0;

  for (final text in texts) {
    painter.text = TextSpan(text: text, style: style);
    painter.layout();
    maxWidth = maxWidth < painter.width ? painter.width : maxWidth;
  }

  return maxWidth;
}
