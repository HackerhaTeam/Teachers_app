import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/features/student/presentation/manager/student_list_cubit.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/course_students/remove_student_from_course_button.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/course_students/course_student_details_row.dart';
class CourseStudnetExraDetails extends StatelessWidget {
  final int index;
  const CourseStudnetExraDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final isExpanded = context.watch<StudentListCubit>().isExpanded(index);

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isExpanded
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h(context)),
                Divider(color: borderColor.transparent),
                SizedBox(height: 16.h(context)),
                CourseDetailsRow(label: 'اسم المادة', value: 'البرمجة 1'),
                SizedBox(height: 14.h(context)),
                CourseDetailsRow(label: 'رقم الهاتف', value: '+963 912 345 678'),
                SizedBox(height: 16.h(context)),
                RemoveStudentFromCourseButton(),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
