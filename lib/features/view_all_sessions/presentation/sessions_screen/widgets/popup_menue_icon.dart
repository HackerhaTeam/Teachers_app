import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/pages/delete_exams_page.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/pages/reorder_sessions_page.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/helpers/get_menue_width.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_cubit.dart';

class PopupMenueIcon extends StatelessWidget {
  const PopupMenueIcon({super.key, required this.cubit});

  final SessionsListCubit cubit;
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
          onTap: () => _showPopupMenu(context, contentColor, bgColor),
        );
      },
    );
  }

  Future<void> _showPopupMenu(
    BuildContext context,
    AppContent contentColor,
    AppBackgrounds bgColor,
  ) async {
    final menuItems = ['إعادة ترتيب الدورة', 'حذف جلسات'];
    final menuWidth = getMenueWidth(menuItems, context.xLabelLarge);
    final position = _calculateMenuPosition(context, menuWidth);

    final selected = await showMenu(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: bgColor.onSurfaceSecondary,
      items: _buildPopupItems(context, contentColor),
    );

    switch (selected) {
      case 'reorder':
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ReorderSessionsPage(items: cubit.state.items),
          ),
        );

        if (result != null && result is List<Map<String, dynamic>>) {
          cubit.updateListOrder(result);
        }

        break;
      case 'delete':
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DeleteExamsPage(items: cubit.state.items),
          ),
        );

        if (result != null && result is List<Map<String, dynamic>>) {
          cubit.updateListOrder(result);
        }

        break;
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

  List<PopupMenuEntry<String>> _buildPopupItems(
    BuildContext context,
    AppContent contentColor,
  ) {
    return [
      PopupMenuItem(
        value: 'reorder',
        child: Text('إعادة ترتيب الدورة', style: context.xLabelLarge),
      ),
      PopupMenuItem(
        value: 'delete',
        child: Text(
          'حذف اختبارت ',
          style: context.xLabelLarge.copyWith(color: contentColor.negative),
        ),
      ),
    ];
  }
}
