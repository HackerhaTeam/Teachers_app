import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/course%20card/icon_text_course_content.dart';

class CourseTags extends StatelessWidget {
  final List<String> tags;
  final AppBorders border;
  final AppBackgrounds background;

  const CourseTags({
    super.key,
    required this.tags,
    required this.border,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Row (spacing:12.w(context) ,
      children: [
        IconTextCourseContent(icon: PhosphorIcons.circlesFour(), title: "دورة شاملة"),
        IconTextCourseContent(icon: PhosphorIcons.student (), title: "+55 طالب"),
        IconTextCourseContent(icon: PhosphorIcons.chalkboardTeacher(), title: "مدرّس واحد"),
      ],
    );
  }
}
