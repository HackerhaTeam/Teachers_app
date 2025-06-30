import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class IconTextCourseContent extends StatelessWidget {
  const IconTextCourseContent(
      {super.key, required this.icon, required this.title});

  final PhosphorIconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;
    return Row(children: [
      PhosphorIcon(icon, size: 16.w(context),color:  content.secondary,),
      SizedBox(width: 2.w(context)),
      Text(
        title,
        style: context.xLabelSmall.copyWith(color: content.secondary),
      )
    ]);
  }
}

