import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/shared/student_list/student_list.dart';

class StudentPageBody extends StatelessWidget {
  const StudentPageBody({super.key, required this.isManagePage});
final bool isManagePage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text('الطلاب المسجلين لديك',
        style:  context.xHeadingLarge
        )]),

        SizedBox(height: 19.h(context)),
        Expanded(child: StudentList(isManagePage:isManagePage,)),
      ],
    );
  }
}
