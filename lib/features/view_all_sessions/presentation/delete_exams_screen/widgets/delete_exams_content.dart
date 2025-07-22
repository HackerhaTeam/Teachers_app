import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/widgets/delete_exams_header.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/widgets/delete_exams_list.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/shared/widgets/confirm_changes_footer.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/shared/widgets/sessions_feature_body.dart';

class DeleteExamsContent extends StatelessWidget {
  const DeleteExamsContent({super.key});

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
          DeleteExamsHeader(),
          SizedBox(height: 34.h(context)),
          Expanded(child: SessionsFeaturBody(list: DeleteExamsList())),
          SizedBox(height: 16.h(context)),
          ConfirmChangesFooter(
            onSaveChanges: () => handleDeleteExamsChanges(context),
          ),
        ],
      ),
    );
  }
}

void handleDeleteExamsChanges(BuildContext context) {
  final cubit = context.read<DeleteExamsCubit>();

  final selectedIndexes = cubit.state.selectedIndexes;
  final examsItems = cubit.state.examsItems;
  final mainItems = List<Map<String, dynamic>>.from(cubit.items);

  final int length = mainItems.length;
  final selectedItems = <Map<String, dynamic>>[];

  for (int i = 0; i < selectedIndexes.length; i++) {
    if (selectedIndexes[i] != null) {
      selectedItems.add(examsItems[i]);
    }
  }

  mainItems.removeWhere((item) => selectedItems.contains(item));

  Navigator.pop(context, length == mainItems.length ? null : mainItems);
}
