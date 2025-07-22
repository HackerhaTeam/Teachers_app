import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    required this.canPop,
  });

  final String title;
  final String content;
  final List<Widget>? actions;
  final bool canPop;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;

    return PopScope(
      canPop: canPop,
      child: AlertDialog(
        backgroundColor: bgColor.onSurfacePrimary,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor.transparent),
          borderRadius: BorderRadius.circular(24.r(context)),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.xHeadingXLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h(context)), 
            Text(
              content,
              style: context.xParagraphLargeLose.copyWith(
                color: contentColor.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: actions,
      ),
    );
  }
}