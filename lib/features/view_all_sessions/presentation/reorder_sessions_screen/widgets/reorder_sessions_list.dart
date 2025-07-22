import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/list_tile_card.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/manager/reorder_sessions_list_cubit/reorder_sessions_list_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/manager/reorder_sessions_list_cubit/reorder_sessions_list_state.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/widgets/long_pointer_listener.dart';

class ReorderSessionsList extends StatelessWidget {
  const ReorderSessionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final cubit = context.read<ReorderSessionsListCubit>();

    return BlocBuilder<ReorderSessionsListCubit, ReorderSessionsListState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.items.length,
          buildDefaultDragHandles: false,
          onReorder: cubit.onReorder,
          proxyDecorator: (child, index, animation) {
            return Material(
              color: Colors.transparent,
              elevation: 0,
              type: MaterialType.transparency,
              child: child,
            );
          },
          itemBuilder: (context, index) {
            final item = state.items[index];

            final String title = item['title'] ?? '';
            final String subTitle = item['subTitle'] ?? '';
            final String type = item['type'] ?? '';

            return Padding(
              key: ValueKey(index),
              padding: EdgeInsets.only(bottom: 8.h(context)),
              child: LongPointerListener(
                onLongPointerDown: () => HapticFeedback.vibrate(),
                child: ReorderableDelayedDragStartListener(
                  index: index,
                  child: Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.list(),
                        size: 16.s(context),
                        color: contentColor.primary,
                      ),
                      SizedBox(width: 8.w(context)),
                      Expanded(
                        child: ListTileCard(
                          childOfRoundedSquareShape: _buildLeadingIcon(
                            item,
                            context,
                          ),
                          index: index,
                          title: title,
                          subTitle: subTitle,
                          circleIconAsset: _getCircleIconForType(type),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildLeadingIcon(
    Map<String, dynamic> item,
    BuildContext context,
  ) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final String type = item['type'] ?? '';

    if (type == 'exam') {
      return PhosphorIcon(
        PhosphorIcons.exam(),
        size: 16.s(context),
        color: contentColor.primaryInverted,
      );
    } else {
      return Text(
        item['numberOfSessions']?.toString() ?? '',
        style: context.xLabelSmall.copyWith(
          color: contentColor.primaryInverted,
        ),
      );
    }
  }

  static String _getCircleIconForType(String type) {
    return type == 'exam' ? AppImages.studentFill : AppImages.playFill;
  }
}
