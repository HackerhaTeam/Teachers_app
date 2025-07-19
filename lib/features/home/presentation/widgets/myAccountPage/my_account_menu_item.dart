// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/gradient_divider.dart';
import 'package:teacher_hackerha/core/widgets/rounded_square_shape.dart';

class MyAccountMenuItem extends StatelessWidget {
  const MyAccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.therIsBreake = true,
  });
  final IconData icon;
  final String title;
  final bool? therIsBreake;

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
      child: Column(
        children: [
          Row(
            children: [
              RoundedSquareShape(
                child: PhosphorIcon(
                  textDirection: TextDirection.ltr,
                  icon,
                  color: contentColor.primaryInverted,
                  size: 16.w(context),
                ),
              ),
              SizedBox(width: 16.w(context)),
              Text(title, style: context.xHeadingSmall),
              const Spacer(),
              PhosphorIcon(PhosphorIcons.caretRight()),
            ],
          ),
          if (therIsBreake!) ...[
            const SizedBox(height: 14),
            const GradientDivider(),
          ],
        ],
      ),
    );
  }
}
