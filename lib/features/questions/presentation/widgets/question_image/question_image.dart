
import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';

class QuestionImage extends StatelessWidget {
  const QuestionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r(context)),
      child: Image.asset('assets/images/code.png', fit: BoxFit.cover),
    );
  }
}
