import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/Entities/course.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/course_image.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/my_course_card.dart';

class MyCoursesItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final Course course;

  const MyCoursesItem({
    super.key,
    required this.border,
    required this.course,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
     
      width: MediaQuery.of(context).size.width * 0.75,
      borderRadius:21.r(context),
      backgroundColor: Colors.transparent,
      borderColor: border.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseImage(
            border: border,
            background: background,
            isNew: false,
          ),
          MyCourseCard(
            imageUrl: AppImages.courseImage,
            progress: 22,
            course: course,
          ),
        ],
      ),
    );
  }
}
