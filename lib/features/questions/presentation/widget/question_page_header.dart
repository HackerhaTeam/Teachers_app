import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/custom_popup_menue_item.dart';
import 'package:teacher_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/core/widgets/popup_menue_icon.dart';

class QuestionPageHeader extends StatelessWidget {
  const QuestionPageHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleIcon(
          iconAsset: getThemeIcon(
            context,
            AppImages.carretRightDark,
            AppImages.carretRightLight,
          ),
          circleSize: 44,
          backgroundColor:
              Theme.of(context).extension<AppBackgrounds>()!.onSurfaceSecondary,
          iconColor: Theme.of(context).extension<AppContent>()!.primary,
        ),
        Text("اختبار الشروط والحلقات", style: context.xHeadingLarge),
        PopupMenuIcon( items: [
      customPopupMenuItem(
          context: context,
          value: 'update',
          child: Text('تعديل بيانات الاختبار', style: context.xLabelLarge),
        ),
        customPopupMenuItem(
          context: context,
          value: 'reorder',
          child: Text('إعادة ترتيب الأسئلة', style: context.xLabelLarge),
        ),

customPopupMenuItem(
          context: context,
          value: 'switch',
          child: Text('تبديل بين سؤالين', style: context.xLabelLarge),
        ),
        customPopupMenuItem(
          context: context,
          value: 'delete',
          child: Text(
            'حذف أسئلة',
            style: context.xLabelLarge.copyWith(color: contentColor.negative),
          ),
        ),
      ], onSelected: (String value) {log(value);  },),
      ],
    );
  }
}
