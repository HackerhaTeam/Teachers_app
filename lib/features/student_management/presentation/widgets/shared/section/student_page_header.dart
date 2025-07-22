
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/student_management/presentation/widgets/course_students/course_students_page_header.dart';
import 'package:teacher_hackerha/features/student_management/presentation/widgets/general_students/general_students_page_header.dart';

class StudentPageHeader extends StatelessWidget {
  const StudentPageHeader({super.key, required this.isManagePage});
  final bool isManagePage;
  @override
  Widget build(BuildContext context) {
    return isManagePage
        ? GeneralStudentsPageHeader()
        : CourseStudentsPageHeader();
  }
}
