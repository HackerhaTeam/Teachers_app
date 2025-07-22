import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_state.dart';

class DeleteExamsHeader extends StatelessWidget {
  const DeleteExamsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return BlocBuilder<DeleteExamsCubit, DeleteExamsState>(
      builder: (context, state) {
        return Row(
          children: [
            CustomCircleIcon(
              onTap: () => Navigator.pop(context),
              circleSize: 44.s(context),
              iconAsset: AppImages.caretRight,
              iconSize: 24.s(context),
              iconColor: contentColor.primary,
              backgroundColor: bgColor.onSurfaceSecondary,
            ),
            SizedBox(width: 8.w(context)),
            Text('البرمجة (1)', style: context.xHeadingXLarge),
            Spacer(),
            CustomCircleIcon(
              onTap: () => context.read<DeleteExamsCubit>().toggleSelectAll(),
              circleSize: 44.s(context),
              iconAsset: AppImages.listChecks,
              iconSize: 24.s(context),
              iconColor: _getBoxChecksIconColor(
                state: state,
                contentColor: contentColor,
              ),
              backgroundColor: bgColor.onSurfaceSecondary,
            ),
          ],
        );
      },
    );
  }

  _getBoxChecksIconColor({
    required DeleteExamsState state,
    required AppContent contentColor,
  }) {
    if (state is DeleteExamsAllSelected) {
      return contentColor.brandPrimary;
    } else {
      return contentColor.primary;
    }
  }
}
