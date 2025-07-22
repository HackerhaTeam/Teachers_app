import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/questions/presentation/manager/quesiton_image_cubit.dart';

class QuestionImageDragHandler extends StatelessWidget {
  const QuestionImageDragHandler({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionImageCubit>();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: cubit.dragStart,
      onVerticalDragUpdate: cubit.dragUpdate,
      onVerticalDragEnd: cubit.dragEnd,
    );
  }
}
