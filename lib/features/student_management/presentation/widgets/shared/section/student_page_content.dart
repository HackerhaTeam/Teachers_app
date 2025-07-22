import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/shared/section/student_page_body.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/shared/section/student_page_header.dart';

class StudentPageContent extends StatelessWidget {
  const StudentPageContent({super.key, required this.isManagePage});
  final bool isManagePage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w(context),

        vertical: 18.h(context),
      ),
      child: Column(
        children: [
          StudentPageHeader(isManagePage: isManagePage),
          SizedBox(height: 40),
          Expanded(child: StudentPageBody(isManagePage: isManagePage)),
        ],
      ),
    );
  }
}
