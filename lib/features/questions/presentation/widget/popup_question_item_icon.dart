import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/custom_popup_menue_item.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/popup_menue_icon.dart';

class PopupQuestionItemIcon extends StatelessWidget {
  const PopupQuestionItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return PopupMenuIcon(
      items: [
        customPopupMenuItem(
          context: context,
          value: 'move',
          child: Text('نقل إلى مجموعة', style: context.xLabelLarge),
        ),
        customPopupMenuItem(
          context: context,
          value: 'delete',
          child: Text(
            'حذف السؤال',
            style: context.xLabelLarge.copyWith(color: contentColor.negative),
          ),
        ),
      ],
      onSelected: (String value) {},
    );
  }
}
