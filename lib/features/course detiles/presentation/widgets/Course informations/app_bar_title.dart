//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class AppBarTitle extends StatelessWidget {
  final bool isCollapsed;
  final double collapseProgress;
  const AppBarTitle({super.key, required this.isCollapsed, required this.collapseProgress});

  double calculateTextOffset(double progress) {
    const double maxOffset =-50;
    return (1.0 - Curves.easeOut.transform(progress)) * maxOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isCollapsed)
          CustomCircleIcon(
            backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.onSurfacePrimary,
            iconAsset: getThemeIcon(context, AppImages.carretRightDark, AppImages.carretRightLight),
            onTap: () => Navigator.pop(context),
            circleSize: 44.w(context),
          ),
        Transform.translate(
          offset: Offset(-calculateTextOffset(collapseProgress), 0),
          child: Padding(
            padding:  EdgeInsets.only(right: isCollapsed?8:50),
            child: Text("البرمجة (1)", style: context.xHeadingMedium),
          ),
        ),
        const Spacer(),
        if (isCollapsed)
          CustomCircleIcon(
            backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.onSurfacePrimary,
            iconAsset: getThemeIcon(context, AppImages.magnifyingGlassDark, AppImages.magnifyingGlassLight),
          //  onTap: () => context.navigateWithSlideTransition(SearchPage()),
            circleSize: 44.w(context),
          ),
      ],
    );
  }
}
