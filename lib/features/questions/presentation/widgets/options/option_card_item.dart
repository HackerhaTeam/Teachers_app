import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class OptionCardItem extends StatelessWidget {
  const OptionCardItem({super.key, required this.isCorrectAnswer});

  final bool isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Row(
        children: [
          CustomCircleIcon(
            iconColor: isCorrectAnswer ? contentColor.primary : null,
            circleSize: 16.s(context),
            iconSize: 10.s(context),
            borderColor: isCorrectAnswer ? null : borderColor.disabled,
            backgroundColor: isCorrectAnswer ? bgColor.successStrong : null,
            iconAsset: isCorrectAnswer ? AppImages.check : null,
          ),
          SizedBox(width: 8.w(context)),
          Expanded(
            child: Text(
              'نص الخيار الأول هنا.',
              style: context.xLabelLarge.copyWith(
                color:
                    isCorrectAnswer
                        ? contentColor.success
                        : contentColor.disabled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
