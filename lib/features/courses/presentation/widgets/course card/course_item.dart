import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/Entities/course.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/course_content.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/course_image.dart';


class CoursesItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;

  final List<String> tagsTitle;

  final Course course;
 final double? width;

  const CoursesItem({
    super.key,
    required this.course,
    required this.border,
    required this.background,
    required this.tagsTitle, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width:width ?? MediaQuery.of(context).size.width * 0.75,
     borderRadius:21.r(context),
      backgroundColor:Colors.transparent,
      borderColor: border.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseImage(
            border: border,
            background: background,
            isNew: true,
          ),
          CourseContent(
            border: border,
            background: background,
            courseName: course.name,
            description: course.description,
            tagsTitle: tagsTitle,
          ),
        ],
      ),
    );
  }
}
