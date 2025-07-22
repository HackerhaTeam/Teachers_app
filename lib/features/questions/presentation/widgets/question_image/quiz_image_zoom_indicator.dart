import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/questions/presentation/manager/quesiton_image_cubit.dart';

class QuestionImageZoomIndicator extends StatelessWidget {
  const QuestionImageZoomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Zoom: ${(zoom * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
