import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class QuestionPageHeader extends StatelessWidget {
  const QuestionPageHeader({super.key,});
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         CustomCircleIcon(
          iconSize: 24.s(context),
          circleSize: 44.s(context),
          iconColor: contentColor.primary,
          backgroundColor: backgroundColor.onSurfaceSecondary,
          iconAsset: AppImages.caretRight,
        ),
        Text('اختبار الشروط والحلقات', style: context.xHeadingXLarge),
        CustomCircleIcon(
          iconSize: 24.s(context),
          circleSize: 44.s(context),
          iconColor: contentColor.primary,
          backgroundColor: backgroundColor.onSurfaceSecondary,
          iconAsset: AppImages.x,
        ),
      ],
    );
  }
}
