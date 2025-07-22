import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CourseDetailsRow extends StatelessWidget {
  final String label;
  final String value;

  const CourseDetailsRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.xLabelMedium.copyWith(color: contentColor.secondary),
          ),
        ),
        Expanded(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              textAlign: TextAlign.end,
              value,
              style: context.xLabelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
