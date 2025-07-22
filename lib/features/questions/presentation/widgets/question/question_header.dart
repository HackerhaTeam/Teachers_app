
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('السؤال الخامس', style: context.xHeadingLarge),

        Text(
          '5 درجات',
          style: context.xLabelLarge.copyWith(color: contentColor.secondary),
        ),
      ],
    );
  }
}
