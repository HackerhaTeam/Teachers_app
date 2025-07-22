import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/widgets/dialog/custom_alert_dialog.dart';

void customShowDialog({
  required BuildContext context,
  required String title,
  required String content,
   List<Widget> ? actions,
  
   bool canPop=true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return CustomAlertDialog(
        canPop: canPop,
        title: title,
        content: content,
        actions:actions
      );
    },
  );
}