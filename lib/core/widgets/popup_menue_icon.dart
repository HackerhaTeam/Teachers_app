import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_menue_width.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';

class PopupMenuIcon extends StatelessWidget {
  const PopupMenuIcon({
    super.key,
    required this.items,
    required this.onSelected,
  });

  final List<PopupMenuEntry<String>> items;
  final void Function(String value) onSelected;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Builder(
      builder: (context) {
        return CustomCircleIcon(
          circleSize: 44.s(context),
          iconAsset: AppImages.dotsThreeVertical,
          iconSize: 24.s(context),
          iconColor: contentColor.primary,
          backgroundColor: bgColor.onSurfaceSecondary,
          onTap: () => _showPopupMenu(context, bgColor),
        );
      },
    );
  }

  Future<void> _showPopupMenu(
    BuildContext context,
    AppBackgrounds bgColor,
  ) async {
    final textStyles = Theme.of(context).textTheme;
    final menuLabels =
        items.map((e) {
          if (e is PopupMenuItem<String> && e.child is Text) {
            return (e.child as Text).data ?? '';
          }
          return '';
        }).toList();

    final menuWidth = getMenueWidth(menuLabels, textStyles.labelLarge!);
    final position = _calculateMenuPosition(context, menuWidth);

    final selected = await showMenu<String>(
      elevation: 0,
      constraints: BoxConstraints(minWidth: 200.w(context)),
      context: context,
      position: position,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: bgColor.onSurfaceSecondary,
      items: items,
    );

    if (selected != null) {
      onSelected(selected);
    }
  }

  RelativeRect _calculateMenuPosition(BuildContext context, double menuWidth) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final screenSize = MediaQuery.of(context).size;
    final buttonPosition = button.localToGlobal(Offset.zero);
    final buttonSize = button.size;

    return RelativeRect.fromLTRB(
      buttonPosition.dx,
      buttonPosition.dy + buttonSize.height + 4.h(context),
      screenSize.width - (buttonPosition.dx - menuWidth),
      0,
    );
  }
}