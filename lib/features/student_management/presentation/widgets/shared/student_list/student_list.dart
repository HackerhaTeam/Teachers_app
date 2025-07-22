
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/student/presentation/manager/student_list_cubit.dart';
import 'package:teacher_hackerha/features/student/presentation/manager/student_list_state.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/shared/student_list/student_list_item.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key, required this.isManagePage});
final bool isManagePage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentListCubit, StudentListState>(
      builder: (context, state) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h(context)),
              child: StudentListItem(
                index: index, isManagePage: isManagePage,
              ),
            );
          },
        );
      },
    );
  }
}