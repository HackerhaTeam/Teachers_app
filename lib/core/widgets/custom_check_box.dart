import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;

    return Stack(
      alignment: Alignment.center,
      children: [
        checkContainer(
          width: 24.w(context),
          height: 24.w(context),
          color: Colors.transparent,
          border: Border.all(color: borderColor.primary),
          radius: 8.r(context),
        ),
        checkContainer(
          width: 16.w(context),
          height: 16.w(context),
          color: bgColor.secondaryBrand,
          border: null,
          radius: 5.r(context),
        ),
      ],
    );
  }

  Container checkContainer({
    required double? width,
    required double? height,
    required Color? color,
    BoxBorder? border,
    required double radius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        border: border,
        color: color,
      ),
    );
  }
}
