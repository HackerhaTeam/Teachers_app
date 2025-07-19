import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';

class RoundedSquareShape extends StatelessWidget {
  const RoundedSquareShape({
    super.key,
    this.gradient,
    this.size,
    this.color,
  required this.child,
  });
  final double? size;
  final Gradient? gradient;
  final Color? color;
 
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: size == null ? 44.w(context) : size!.w(context) + 4.w(context),
          height:
              size == null ? 44.w(context) : size!.w(context) + 4.w(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r(context)),
            gradient: gradient,
          ),
        ),
        CustomCard(
          width: size == null ? 40.w(context) : size!.w(context),
          height: size == null ? 40.w(context) : size!.w(context),
          borderRadius: 16.r(context),
          backgroundColor: color ?? backgroundColor.primaryBrand,
          child: Center(child: child)
        ),
      ],
    );
  }
}
