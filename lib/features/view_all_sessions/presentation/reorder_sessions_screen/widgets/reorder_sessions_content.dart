import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/manager/reorder_sessions_list_cubit/reorder_sessions_list_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/widgets/reorder_sessions_header.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/widgets/reorder_sessions_list.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/shared/widgets/confirm_changes_footer.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/shared/widgets/sessions_feature_body.dart';

class ReorderSessionsContent extends StatelessWidget {
  const ReorderSessionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w(context),
        vertical: 20.h(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReorderSessionsHeader(),
          SizedBox(height: 34.h(context)),
          Expanded(child: SessionsFeaturBody(list: ReorderSessionsList())),
          SizedBox(height: 16.h(context)),
          ConfirmChangesFooter(
            onSaveChanges:
                () => Navigator.pop(
                  context,
                  context.read<ReorderSessionsListCubit>().state.items,
                ),
          ),
        ],
      ),
    );
  }
}
