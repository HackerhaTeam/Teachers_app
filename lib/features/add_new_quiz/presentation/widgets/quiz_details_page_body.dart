import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/functions/navigation.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/big_next_button.dart';
import 'package:teacher_hackerha/core/widgets/pages_wrapper.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/no_quistions_u_i.dart';

class QuizDetailsPageBody extends StatelessWidget {
  const QuizDetailsPageBody({super.key, required this.degree});
  final String degree;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BigFloatButton(
        text: 'إضافة سؤال جديد',
        value: true,
        onPressed: () {
          context.navigateWithSlideTransition(PagesWrapper(isAuth: false));
        },
        showCarret: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("اختبار الشروط والحلقات", style: context.xHeadingXLarge),
                SizedBox(height: 34),
                Text(
                  'علامة الاختبار الكلية: $degree',
                  style: context.xHeadingLarge,
                ),
                SizedBox(height: 122.h(context)),
                NoQuistionsUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
