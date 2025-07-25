import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CourseImage extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final bool isNew;

  const CourseImage({
    super.key,
    required this.border,
    required this.background,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(21.r(context)),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            AppImages.courseImage,
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
          ),
          if (isNew)
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 60.w(context),
                color: background.negativeStrong,
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "جديد",
                    style: context.
                        xLabelSmall
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
