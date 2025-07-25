import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class CoursesPageHeader extends StatelessWidget {
  const CoursesPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          Text(
            'الرئيسية',
            style: context.xHeadingLarge,
          ),
          const Spacer(),
          CustomCircleIcon(
            backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.onSurfaceSecondary
            ,iconAsset:getThemeIcon(context, AppImages.magnifyingGlassDark, AppImages.magnifyingGlassLight),
            //icon: PhosphorIcons.magnifyingGlass(),
            onTap: () {
           //   context.navigateWithSlideTransition(SearchPage());
            }, circleSize: 44.w(context),
          )
        ],
      ),
    );
  }
}
