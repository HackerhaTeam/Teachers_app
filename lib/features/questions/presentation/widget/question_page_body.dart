import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/question_page_header.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/question_reorderable_list_veiw.dart';

class QuestionPageBody extends StatelessWidget {
  const QuestionPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20.w(context),
            left: 20.w(context),
          ),
    
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: QuestionPageHeader()),
                SliverToBoxAdapter(child: SizedBox(height: 25)),
                SliverToBoxAdapter(
                  child: Text(
                    " علامة الاختبار الحالية: ${30} / ${15} ",
                    style: context.xHeadingLarge,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 8)),
                SliverToBoxAdapter(
                  child: Text(
                    "أسئلة عشوائية",
                    style: context.xHeadingSmall.copyWith(
                      color: Theme.of(context).extension<AppContent>()!.secondary,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 8)),
                SliverToBoxAdapter(
              child: QuestionReorderableListVeiw(),
            )
            ,
            
              ],
            ),
          ),
        );
  }
}