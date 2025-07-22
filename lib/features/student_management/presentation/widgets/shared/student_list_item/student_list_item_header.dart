import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/student_management/presentation/manager/student_list_cubit.dart';

class StudentListItemHeader extends StatelessWidget {
  final int index;
  const StudentListItemHeader({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final isExpanded =
        context.watch<StudentListCubit>().isExpanded(index);

    return GestureDetector(
      onTap: () => context.read<StudentListCubit>().updateExpandedIndex(index),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            CustomCircleIcon(
              circleSize: 40.s(context),
              iconSize: 40.s(context),
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 12.w(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('أحمد أحمد', style: context.xLabelLarge),
                Text(
                  'جامعة حلب - سنة ثالثة',
                  style: context.xParagraphSmall.copyWith(
                    color: contentColor.secondary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            PhosphorIcon(_getCaretIcon(isExpanded), size: 16.s(context)),
          ],
        ),
      ),
    );
  }
}

IconData _getCaretIcon(bool isExpanded) {
  if (isExpanded) {
    return PhosphorIcons.caretDown();
  } else {
    return PhosphorIcons.caretUp();
  }
}
