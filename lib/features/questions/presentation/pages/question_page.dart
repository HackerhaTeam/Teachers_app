import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/custom_button.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/question_page_body.dart';
class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    var bg = Theme.of(context).extension<AppBackgrounds>()!;
    var content = Theme.of(context).extension<AppContent>()!;
    return  Scaffold(body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        QuestionPageBody(),
        
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            CustomButton(borderRadius:24,borderColor:bg.primaryBrand ,color: bg.surfacePrimary,width:176.w(context),height: 56,child: Text("رفع الاختبار",style: context.xLabelLarge.copyWith(color: content.primary),), onPressed: (){}),
            CustomButton(borderRadius:24 ,color:bg.primaryBrand,width:176.w(context),height: 56 ,onPressed: () {  },
          
            child: Text("إضافة سؤال جديد",style: context.xLabelLarge.copyWith(color: content.primaryInverted),),),
            ],
            ),
        ),
        
      ],
    ),);
  }
}
