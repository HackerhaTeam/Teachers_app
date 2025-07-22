
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class QuestionNote extends StatelessWidget {
  const QuestionNote({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملاحظة:',
          style: context.xHeadingSmall.copyWith(color: contentColor.success),
        ),

        SizedBox(height: 8.h(context)),
        Text(
          'هنا يمكن أن نخبر المستخدم لماذا الخيار الأول خاطئ والآخر هو الصحيح بطريقة “اختيارية” للأستاذ إن أراد توضيح هذا السؤال بالذات. :',
          style: context.xParagraphLargeNormal,
        ),
      ],
    );
  }
}
