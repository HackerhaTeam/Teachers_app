
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class SessionsFeaturBody extends StatelessWidget {
  const SessionsFeaturBody({super.key, required this.list});
  final Widget list;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'محتويات الدورة',
          style: context.xHeadingSmall.copyWith(color: contentColor.secondary),
        ),
        SizedBox(height: 12.h(context)),
        Expanded(child: list),
      ],
    );
  }
}