import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class ReorderSessionsHeader extends StatelessWidget {
  const ReorderSessionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Row(
      children: [
        CustomCircleIcon(
          onTap: () {
            Navigator.pop(context);
          },
          circleSize: 44.s(context),
          iconAsset: AppImages.caretRight,
          iconSize: 24.s(context),
          iconColor: contentColor.primary,
          backgroundColor: bgColor.onSurfaceSecondary,
        ),
        SizedBox(width: 8.w(context)),
        Text('البرمجة (1)', style: context.xHeadingXLarge),
      ],
    );
  }
}
