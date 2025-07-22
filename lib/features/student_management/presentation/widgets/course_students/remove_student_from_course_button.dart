import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/custom_button.dart';
import 'package:teacher_hackerha/core/widgets/dialog/custom_alert_dialog_actions.dart';
import 'package:teacher_hackerha/core/widgets/dialog/custom_show_dialog.dart';

class RemoveStudentFromCourseButton extends StatelessWidget {
  const RemoveStudentFromCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;

    return CustomButton(
      color: Colors.transparent,
      width: 120.w(context),
      borderRadius: 8.r(context),
      borderColor: borderColor.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w(context),
          vertical: 8.h(context),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIcons.trash(),
                color: contentColor.negative,
                size: 15.s(context),
              ),
              SizedBox(width: 6.w(context)),
              Text(
                'حذف من الدورة',
                style: context.xLabelSmall.copyWith(
                  color: borderColor.negative,
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        customShowDialog(
          context: context,
          title: 'هل تود حذف الطالب “أحمد أحمد” من الدورة؟',
          content:
              'حذفك للطالب سيؤدي إلى حظره من الوصول لمحتوى هذه المادة بشكل نهائي!',

          actions: [
            CustomAlertDialogActions(
              leftActionText: 'الحذف والحظر',
              rightActionText: 'الإلغاء والتراجع',
              leftOnPressed: () {},
              rightOnPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
