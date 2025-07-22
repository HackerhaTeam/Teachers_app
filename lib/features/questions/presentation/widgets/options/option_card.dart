import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/options/option_card_item.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.isCorrectAnswer});
  final bool isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
      borderColor:
          isCorrectAnswer ? borderColor.success : borderColor.transparent,
      backgroundColor: backgroundColor.onSurfacePrimary,

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h(context)),
        child: OptionCardItem(isCorrectAnswer: isCorrectAnswer),
      ),
    );
  }
}
