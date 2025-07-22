
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';

class GeneralStudentSubjects extends StatelessWidget {
  const GeneralStudentSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> subjects = [
      'عربي',
      'برمجة 1',
      'معطيات 1',
      'معالج مصغر',
      'بنية تنظيم الحاسب',
      'شبكات',
      'معالجة اشارة',
    ];
    final borderColor = Theme.of(context).extension<AppBorders>()!;

    return Wrap(
      spacing: 16.w(context),
      runSpacing: 16.h(context),
      children: List.generate(
        subjects.length,
        (index) => CustomCard(
          borderRadius: 8.h(context),
          borderColor: borderColor.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w(context),

              vertical: 4.h(context),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text(subjects[index], style: context.xLabelSmall)],
            ),
          ),
        ),
      ),
    );
  }
}
