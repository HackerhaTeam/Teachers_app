import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/Entities/course.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/course_item.dart';
class CourseList extends StatelessWidget {
  final Axis scrollDirection;
  final List<Course> courses;

  const CourseList({
    super.key,
    required this.courses,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;

    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      child: scrollDirection == Axis.horizontal
          ? Row(
              children: List.generate(
                courses.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 1.w(context) : 10.w(context),
                    right: 10.w(context),
                  ),
                  child: CoursesItem(
                    course: courses[index],
                    border: border,
                    background: background,
                    tagsTitle: ["مدرّس 1", "دورة شاملة", "22 طالب"],
                  ),
                ),
              ),
            )
          : Column(spacing: 20,
              children: List.generate(
                courses.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 1.h(context) : 2.h(context),
                    bottom: 2.h(context),
                  ),
                  child: CoursesItem(width:372.w(context),
                    course: courses[index],
                    border: border,
                    background: background,
                    tagsTitle: ["مدرّس 1", "دورة شاملة", "22 طالب"],
                  ),
                ),
              ),
            ),
    );
  }
}
