import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/dialog/alert_dialog_actions.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/dialog/custom_alert_dialog.dart';

void showQuistionDialog({
  required BuildContext context,
  // required String title,
  // required String content,
  // required String leftActionText,
  // required String rightActionText,
  VoidCallback? onLeftPressed,
  VoidCallback? onRightPressed,
  bool canPop = true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return CustomAlertDialog(
        canPop: canPop,
        title: "هل أنت متأكد من إلغاء إضافة السؤال؟",
        content:
            "سيؤدي هذا الإجراء إلى فقدان جميع البيانات التي تم إدخالها لهذا السؤال.",
        actions: [
          AlertDialogActions(
            leftActionText: "إلغاء الإضافة",
            rightActionText: "تجاهل",
            leftOnPressed: () {
              Navigator.of(context).pop();
              if (onLeftPressed != null) {
                onLeftPressed();
              }
            },
            rightOnPressed: () {
              Navigator.of(dialogContext).pop();
              if (onRightPressed != null) {
                onRightPressed();
              }
            },
          ),
        ],
      );
    },
  );
}
