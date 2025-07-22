import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/question_image_card.dart';

class QuestionInfo extends StatelessWidget {
  const QuestionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ليكن لديك المخطط', style: context.xParagraphXLarge),
        SizedBox(height: 16.h(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [QuestionImageCard()],
        ),
        SizedBox(height: 16.h(context)),
        Text(
          'المطلوب: كذا وكذا يكتب الأستاذ السؤال هنا',
          style: context.xParagraphLargeLose,
        ),
      ],
    );
  }
}
