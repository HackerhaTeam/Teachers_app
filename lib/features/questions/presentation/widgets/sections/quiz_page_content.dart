import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/sections/question_page_body.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/sections/question_page_header.dart';

class QuestionPageContent extends StatelessWidget {
  const QuestionPageContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h(context),
        horizontal: 20.w(context),
      ),
      child: Column(
        children: [
          QuestionPageHeader(),
          SizedBox(height: 24.h(context)),
          Expanded(child: QuestionPageBody()),
        ],
      ),
    );
  }
}
