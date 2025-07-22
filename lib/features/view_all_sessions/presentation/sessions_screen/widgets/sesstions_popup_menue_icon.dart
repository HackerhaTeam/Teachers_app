
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/popup_menue_icon.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/pages/delete_exams_page.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/pages/reorder_sessions_page.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_cubit.dart';

class SesstionsPopMenuIcon extends StatelessWidget {
  const SesstionsPopMenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return PopupMenuIcon(
      items: [
        PopupMenuItem(
          value: 'reorder',
          child: Text('إعادة ترتيب الدورة', style: context.xLabelLarge),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text(
            'حذف اختبارات',
            style: context.xLabelLarge.copyWith(color: contentColor.negative),
          ),
        ),
      ],
      onSelected: (value) async {
        final cubit = context.read<SessionsListCubit>();

        if (value == 'reorder') {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReorderSessionsPage(items: cubit.state.items),
            ),
          );
          if (result != null) cubit.updateListOrder(result);
        }

        if (value == 'delete') {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DeleteExamsPage(items: cubit.state.items),
            ),
          );
          if (result != null) cubit.updateListOrder(result);
        }
      },
    );
  }
}
