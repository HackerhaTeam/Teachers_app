import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class NoQuistionsUI extends StatelessWidget {
  const NoQuistionsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            height: 211.h(context),
            width: 231.w(context),
            getThemeIcon(
              context,
              AppImages.nullQuizDark,
              AppImages.nullQuizLight,
            ),
          ),
          SizedBox(height: 47.h(context)),
          Text("لا يوجد أسئلة في هذا الاختبار", style: context.xDisplayLarge),
          SizedBox(height: 8),
          Text(
            "يرجى إضافة سؤال جديد لهذا الاختبار الآن.",
            style: context.xParagraphLargeNormal,
          ),
        ],
      ),
    );
  }
}
