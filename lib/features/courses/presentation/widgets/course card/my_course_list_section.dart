import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/Entities/course.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/my_courses_item.dart';


class MyCourseListSection extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final List<Course> courses;

  const MyCourseListSection({
    super.key,
    required this.border,
    required this.background,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                courses.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 1.w(context) : 10.w(context),
                    right: 10.w(context),
                  ),
                  child: MyCoursesItem(
                    border: border,
                    background: background,
                    course: courses[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  }
