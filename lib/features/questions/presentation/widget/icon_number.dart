import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/rounded_square_icon.dart';

class IconNumber extends StatelessWidget {
  const IconNumber({super.key, required this.numbre});
final int numbre;
  @override
  Widget build(BuildContext context) {
    return RoundedSquareShape(
      child: Text(
        "$numbre".padLeft(2, '0'),
        style: context.xLabelSmall.copyWith(
          color: Theme.of(context).extension<AppContent>()!.primaryInverted,
        ),
      ),
    );
  }
}
