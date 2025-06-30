//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/course%20detiles/presentation/widgets/Course%20informations/course_information_image.dart';


class AppBarBackground extends StatelessWidget {
  final bool isCollapsed;
  final double collapseProgress;
  const AppBarBackground({super.key, required this.isCollapsed, required this.collapseProgress});

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return Container(
      color: background.surfacePrimary,
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(collapseProgress),
              BlendMode.lighten,
            ),
            child: const CourseInformationImage(),
          ),
          if (!isCollapsed)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w(context), vertical: 60.h(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCircleIcon(
                    backgroundColor: background.containerStatic,
                    iconAsset: AppImages.carretRightLight,
                    onTap: () => Navigator.pop(context),
                    circleSize: 44.w(context),
                  ),
                  CustomCircleIcon(
                    backgroundColor: background.containerStatic,
                    iconAsset: AppImages.magnifyingGlassLight,
             //       onTap: () => context.navigateWithSlideTransition(SearchPage()),
                    circleSize: 44.w(context),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
