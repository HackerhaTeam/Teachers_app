import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/functions/custom_popup_menue_item.dart';
import 'package:teacher_hackerha/core/widgets/dialog/custom_alert_dialog_actions.dart';
import 'package:teacher_hackerha/core/widgets/dialog/custom_show_dialog.dart';
import 'package:teacher_hackerha/core/widgets/popup_menue_icon.dart';

class QuestionPopupMenueIcon extends StatelessWidget {
  const QuestionPopupMenueIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return PopupMenuIcon(
      items: [
        customPopupMenuItem(
          value: 'edit',
          child: Text('تعديل السؤال', style: context.xLabelLarge),
          context: context,
        ),

        customPopupMenuItem(
          value: 'delete',
          child: Text(
            'حذف السؤال',
            style: context.xLabelLarge.copyWith(color: contentColor.negative),
          ),
          context: context,
        ),
      ],
      onSelected: (value) {
        if (value == 'delete') {
          customShowDialog(
            title: 'هل أنت متأكد من حذف هذا السؤال؟',
            content:
                'عند تأكيد الحذف، سيتم إزالة السؤال بشكل نهائي ولا يمكن التراجع عن هذا الإجراء.',
            actions: [
              CustomAlertDialogActions(
                leftActionText: 'حذف',
                rightActionText: 'إلغاء',
                leftOnPressed: () {},
                rightOnPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            context: context,
          );
        }
      },
    );
  }
}
