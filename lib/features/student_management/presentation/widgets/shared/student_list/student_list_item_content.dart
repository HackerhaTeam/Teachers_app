
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/student_management/presentation/widgets/course_students/course_student_extra_details.dart';
import 'package:teacher_hackerha/features/student_management/presentation/widgets/general_students/general_students_extra_details.dart';

class StudentListItemContent extends StatelessWidget {
  const StudentListItemContent({
    super.key,
    required this.isManagePage,
    required this.index,
  });
  final bool isManagePage;
  final int index;
  @override
  Widget build(BuildContext context) {
    return isManagePage
        ? GeneralStudentsExtraDetails(index: index)
        : CourseStudnetExraDetails(index: index);
  }
}
