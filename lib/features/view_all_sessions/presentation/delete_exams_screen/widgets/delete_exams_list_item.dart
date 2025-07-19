
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/widgets/custom_check_box.dart';
import 'package:teacher_hackerha/core/widgets/list_tile_card.dart';

class DeleteExamsListItem extends StatelessWidget {
  const DeleteExamsListItem({
    super.key,
    required this.index,
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.onTap,
  });

  final int index;
  final String title;
  final String subTitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h(context)),
        child: Row(
          children: [
            if (isSelected) ...[
              const CustomCheckBox(),
              SizedBox(width: 8.h(context)),
            ],
            Expanded(
              child: ListTileCard(
                childOfRoundedSquareShape: PhosphorIcon(
                  PhosphorIcons.exam(),
                  size: 16.s(context),
                  color: contentColor.primaryInverted,
                ),
                index: index,
                title: title,
                subTitle: subTitle,
                circleIconAsset: AppImages.studentFill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
