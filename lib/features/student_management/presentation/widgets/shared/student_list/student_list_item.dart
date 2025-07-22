import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/student_management/presentation/widgets/shared/student_list/student_list_item_content.dart';
import 'package:teacher_hackerha/features/student_management/presentation/widgets/shared/student_list/student_list_item_header.dart';

class StudentListItem extends StatelessWidget {
  const StudentListItem({
    super.key,
    required this.index,
    required this.isManagePage,
  });
  final bool isManagePage;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;

    return CustomCard(
      backgroundColor: bgColor.onSurfacePrimary,
      borderColor: borderColor.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w(context),
          vertical: 16.h(context),
        ),
        child: Column(
          children: [
            StudentListItemHeader(index: index),
            StudentListItemContent(isManagePage: isManagePage, index: index),
          ],
        ),
      ),
    );
  }
}
