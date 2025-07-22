
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/questions/presentation/manager/quesiton_image_cubit.dart';
import 'package:teacher_hackerha/features/questions/presentation/model/question_image_details.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/pointer_event_listener.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/question_image_drag_handler.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/question_image_view.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/question_image/quiz_image_zoom_indicator.dart';

class FullScreenImageViewer extends StatefulWidget {
  const FullScreenImageViewer({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late final StreamSubscription<void> _popSubscription;
  @override
  void initState() {
    super.initState();
    _popSubscription = context.read<QuestionImageCubit>().popStream.listen((_) {
      if (!mounted) return;
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _popSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<QuestionImageCubit>().restartObacityValue();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<QuestionImageCubit, QuestionImageDetails>(
            builder: (context, state) {
              return PointerEventListener(
                onPointerDown: context.read<QuestionImageCubit>().onPointerDown,
                onPointerUp: context.read<QuestionImageCubit>().onPointerUp,
                onPointerCancel: context.read<QuestionImageCubit>().onPointerCancel,
                child: Container(
                 color: Colors.black.withAlpha((state.opacity * 255).round()),
                  child: Stack(
                    children: [
                      QuestionImageView(
                        imagePath: widget.imagePath,
                        dragVerticalPosition: state.dragVerticalPosition,
                      ),
                      if (state.showZoom) const QuestionImageZoomIndicator(),
                      if (_enableDrag(state))
                        const QuestionImageDragHandler(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool _enableDrag(QuestionImageDetails state) {
    return double.parse(state.logicalScale.toStringAsFixed(3)) == 1.000 &&
        (state.pointerIds.length == 1 || state.pointerIds.isEmpty);
  }
}
