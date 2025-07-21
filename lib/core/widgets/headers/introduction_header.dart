import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/rounded_square_icon.dart';

class IntroductionHeader extends StatelessWidget {
  const IntroductionHeader({
    super.key,
    required this.introText,
    required this.icon,
  });

  final IconData icon;
  final String introText;

  @override
  Widget build(BuildContext context) {
    // final content = Theme.of(context).extension<AppContent>()!;
    return Padding(
      padding: EdgeInsets.only(top: 34, bottom: 8),
      child: Row(
        children: [
          RoundedSquareIcon(
            iconSize: 24.s(context),
            icon: icon,
            size: 44.s(context),
          ),
          SizedBox(width: 16),
          Text(introText, style: context.xHeadingXLarge),
        ],
      ),
    );
  }
}
