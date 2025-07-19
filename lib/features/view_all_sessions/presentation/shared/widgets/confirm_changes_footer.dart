
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/custom_button.dart';

class ConfirmChangesFooter extends StatelessWidget {
  const ConfirmChangesFooter({super.key, required this.onSaveChanges});
  final void Function() onSaveChanges;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            borderRadius: 24.r(context),
            height: 56.h(context),
            width: double.infinity,
            color: Colors.transparent,
            borderColor: borderColor.primaryBrand,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4.w(context)),
                Text(
                  'تجاهل التغييرات',
                  style: context.xLabelLarge.copyWith(
                    color: contentColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w(context)),
        Expanded(
          child: CustomButton(
            borderRadius: 24.r(context),
            height: 56.h(context),
            width: double.infinity,
            color: bgColor.primaryBrand,
            onPressed: onSaveChanges,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4.w(context)),
                Text(
                  'حفظ التغييرات',
                  style: context.xLabelLarge.copyWith(
                    color: contentColor.primaryInverted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
