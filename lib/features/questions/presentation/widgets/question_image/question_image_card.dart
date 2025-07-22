import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/questions/presentation/manager/quesiton_image_cubit.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/full_screen_image_viewer.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/question_image.dart';

class QuestionImageCard extends StatelessWidget {
  const QuestionImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return GestureDetector(
      onTap: () => _onTap(context),
      child: CustomCard(
        thicknessBorder: 4,
        width: 230.w(context),
        height: 144.h(context),
        backgroundColor: Colors.transparent,
        borderColor: borderColor.transparent,
        borderRadius: 12.r(context),
        child: const Hero(
          tag: 'assets/images/code.png',
          child: QuestionImage(),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    final dragThreshold = 30.h(context);

    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder:
            (_, __, ___) => BlocProvider(
              create:
                  (context) => QuestionImageCubit(dragThreshold: dragThreshold),
              child: const FullScreenImageViewer(
                imagePath: 'assets/images/code.png',
              ),
            ),
      ),
    );
  }
}
