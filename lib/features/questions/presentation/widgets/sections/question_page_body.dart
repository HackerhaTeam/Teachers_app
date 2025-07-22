import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/options/options_list_view.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question/question_header.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question/question_info.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question/question_note.dart';

class QuestionPageBody extends StatelessWidget {
  const QuestionPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionHeader(),
          SizedBox(height: 24.h(context)),
          QuestionInfo(),
          SizedBox(height: 24.h(context)),
          OptionsListView(),
          SizedBox(height: 24.h(context)),
          QuestionNote(),
        ],
      ),
    );
  }
}
