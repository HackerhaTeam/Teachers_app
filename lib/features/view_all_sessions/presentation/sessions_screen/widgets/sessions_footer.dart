import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/custom_button.dart';

class SessionsFooter extends StatelessWidget {
  const SessionsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return CustomButton(
      height: 54.h(context),
      color: bgColor.primaryBrand,
      borderRadius: 24.r(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(
            PhosphorIcons.plus(),
            color: contentColor.primaryInverted,
          ),
          SizedBox(width: 4.w(context)),
          Text(
            'إضافة اختبار جديد',
    
            style: context.xLabelLarge.copyWith(
              color: contentColor.primaryInverted,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
