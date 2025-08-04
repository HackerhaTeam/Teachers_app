import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/helpers/get_question_number.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class QuestionNumberAndMark extends StatelessWidget {
  const QuestionNumberAndMark({super.key, required this.mark});
final int mark;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("السؤال ${convertToArabicOrdinal(mark-2)}", style: context.xHeadingSmall,overflow: TextOverflow.ellipsis,maxLines: 1,),
        SizedBox(height: 4),
        Text(
          "$mark درجات",
          style: context.xLabelSmall.copyWith(
            color: Theme.of(context).extension<AppContent>()!.secondary,
          ),
        ),
      ],
    );
  }
}
