import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class GeneralStudentsPageHeader extends StatelessWidget {
  const GeneralStudentsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Row(
      children: [
        Text('إدارة الطلاب', style: context.xHeadingXLarge),
        Spacer(),
        CustomCircleIcon(
          circleSize: 44.s(context),
          backgroundColor: bgColor.onSurfaceSecondary,
          iconColor: contentColor.primary,
          iconAsset: AppImages.magnifyingGlass,
          iconSize: 24.s(context),
        ),
      ],
    );
  }
}
