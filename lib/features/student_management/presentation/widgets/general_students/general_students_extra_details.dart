import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/student/presentation/manager/student_list_cubit.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/general_students/general_student_phone_row.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/general_students/general_student_subjects.dart';

class GeneralStudentsExtraDetails extends StatelessWidget {
  final int index;
  const GeneralStudentsExtraDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).extension<AppBorders>()!;

    final contentColor = Theme.of(context).extension<AppContent>()!;

    final isExpanded = context.watch<StudentListCubit>().isExpanded(index);

    return AnimatedCrossFade(
      firstChild: const SizedBox.shrink(),
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h(context)),
          Divider(color: borderColor.transparent),
          SizedBox(height: 16.h(context)),

          Row(
            children: [
              Text(
                'المواد المسجل بها',
                style: context.xLabelMedium.copyWith(
                  color: contentColor.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h(context)),
          GeneralStudentSubjects(),
          SizedBox(height: 14.h(context)),
          GeneralStudentPhoneRow(),
        ],
      ),
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeIn,
    );
  }
}
