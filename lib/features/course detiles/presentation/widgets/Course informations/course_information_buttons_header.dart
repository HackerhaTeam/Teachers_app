import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class CourseInformationButtonsHeader extends StatelessWidget {
  const CourseInformationButtonsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleIcon(
          backgroundColor:
              Theme.of(context).extension<AppBackgrounds>()!.containerStatic,
        iconAsset: AppImages.carretRightLight,
        
   
          onTap: () {
            Navigator.pop(context);
          }, circleSize: 44.w(context),
        ),
        CustomCircleIcon(
         
            iconAsset: AppImages.bookMarkSimpleLight,
         
         
          onTap: () {},
          backgroundColor:
              Theme.of(context).extension<AppBackgrounds>()!.containerStatic, circleSize: 44.w(context),
        )
      ],
    );
  }
}
