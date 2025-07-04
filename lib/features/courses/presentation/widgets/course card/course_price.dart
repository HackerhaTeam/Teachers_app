import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CoursePrice extends StatelessWidget {
  const CoursePrice({
    super.key, this.oldPrice,

  });

final int? oldPrice;

  @override
  Widget build(BuildContext context) {
    final appContent = Theme.of(context).extension<AppContent>()!;

    return Row(spacing: 4.w(context),
      children: [
       oldPrice!=null? Text("$oldPrice ألف ل.س",style: context.xLabelSmall.copyWith(decoration: TextDecoration.lineThrough,
        decorationColor: appContent.negative,
        color: appContent.negative),):SizedBox(),
        Text("500 ألف ل.س",style: context.xLabelLarge.copyWith(color: appContent.primary),),
      ],
    );
  }
}
