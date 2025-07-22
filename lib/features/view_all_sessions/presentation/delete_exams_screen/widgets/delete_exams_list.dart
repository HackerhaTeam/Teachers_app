import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_state.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/widgets/delete_exams_list_item.dart';

class DeleteExamsList extends StatelessWidget {
  const DeleteExamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteExamsCubit, DeleteExamsState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.examsItems.length,
          itemBuilder: (context, index) {
            final exam = state.examsItems[index];
            final isSelected = state.selectedIndexes[index] == index;

            return DeleteExamsListItem(
              index: index,
              title: exam['title'],
              subTitle: exam['subTitle'],
              isSelected: isSelected,
              onTap: () => context.read<DeleteExamsCubit>().selectIndex(index),
            );
          },
        );
      },
    );
  }
}
