import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/questions/presentation/manager/quesiton_image_cubit.dart';

class QuestionImageZoomIndicator extends StatelessWidget {
  const QuestionImageZoomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;

    final zoom = context.select<QuestionImageCubit, double>(
      (cubit) => cubit.state.logicalScale,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              borderColor: borderColor.transparent,
              borderRadius: 12.r(context),
              backgroundColor: bgColor.onSurfacePrimary,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Zoom: ${(zoom * 100).toStringAsFixed(0)}%',
                style: context.xLabelLarge.copyWith(
                  color: contentColor.brandPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
