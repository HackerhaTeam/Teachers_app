import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';

class HomeDivider extends StatelessWidget {
  const HomeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 1,
    width: double.infinity,color: Theme.of(context).extension<AppBorders>()!.transparent,);
  }
}