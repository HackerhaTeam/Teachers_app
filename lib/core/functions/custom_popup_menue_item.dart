import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';

PopupMenuEntry<String> customPopupMenuItem({
  required BuildContext context,
  required Widget child,
  required String value,
}) {
  return PopupMenuItem<String>(
    padding: EdgeInsets.only(
      right: 12.w(context),
      top: 8.h(context),
      bottom: 8.h(context),
    ),
    height: 40.h(context),
    value: value,
    child: child,
  );
}