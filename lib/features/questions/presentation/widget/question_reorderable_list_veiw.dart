import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/questions_card_content.dart';

class QuestionReorderableListVeiw extends StatefulWidget {
  const QuestionReorderableListVeiw({super.key});

  @override
  State<QuestionReorderableListVeiw> createState() => _QuestionReorderableListVeiwState();
}

  List<int > numbers =[];
class _QuestionReorderableListVeiwState extends State<QuestionReorderableListVeiw> {
  @override
  Widget build(BuildContext context) {
 // List<int> numbers = [1,2,3];
    return  ReorderableListView.builder(
                
  
        
                key: ValueKey('reorderable_list'),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                itemCount: 4,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final item = numbers.removeAt(oldIndex);
                    numbers.insert(newIndex, item);
                  });
                },
                
                itemBuilder: (context, index) {
                  numbers.add(index+1);
            
                  return Padding(
                    key: ValueKey(index), 
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CustomCard(
                      alignment: Alignment.center,
                                  height: 78,
                                  width: 372.w(context),
                                  backgroundColor: Theme.of(context)
                                      .extension<AppBackgrounds>()!
                                      .onSurfacePrimary,
                                  borderColor: Theme.of(context)
                                      .extension<AppBorders>()!
                                      .transparent,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
                                    child: QuestionsCardContent(number: numbers.isNotEmpty?numbers[index]:index+1),
                                  ),
                                ),
                  );
                },
              );
  }
}
