import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/icon_number.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/popup_question_item_icon.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/question_number_and_mark.dart';

class QuestionsCardContent extends StatelessWidget {
  const QuestionsCardContent({super.key, required this.number});
  final int number;
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        IconNumber(numbre: number,),
        SizedBox(width: 8.w(context)),
        QuestionNumberAndMark(mark:number+2,),
        Spacer(),
        PopupQuestionItemIcon()
      ],
    );
  }
}
