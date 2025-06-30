//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/course%20detiles/presentation/widgets/Course%20informations/custom_course_information_card_icon_text.dart';


class CourseInfoCardIcons extends StatelessWidget {
  const CourseInfoCardIcons({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: Wrap(
          spacing: 16.w(context),
          runSpacing: 8,
          children: const [
            CustomCourseInformationCardIconText(),
            CustomCourseInformationCardIconText(),
            CustomCourseInformationCardIconText(),
          ],
        ),
      ),
    );
  }
}