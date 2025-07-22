import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/questions/presentation/manager/quesiton_image_cubit.dart';
class QuestionImageView extends StatelessWidget {
  final String imagePath;
  final double dragVerticalPosition;

  const QuestionImageView({
    super.key,
    required this.imagePath,
    required this.dragVerticalPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, dragVerticalPosition),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            dragVerticalPosition != 0 ? 12.r(context) : 0,
          ),
          child: PhotoView(
            controller: context.read<QuestionImageCubit>().photoViewController,
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained * 5,
            basePosition: Alignment.center,
            enableRotation: false,
            tightMode: true,
            heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
            imageProvider: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
