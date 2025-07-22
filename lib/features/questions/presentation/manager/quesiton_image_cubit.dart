import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:teacher_hackerha/features/questions/presentation/model/question_image_details.dart';

class QuestionImageCubit extends Cubit<QuestionImageDetails> {
  QuestionImageCubit({required this.dragThreshold})
    : super(
        QuestionImageDetails(
          logicalScale: 1.0,
          pointerIds: [],
          dragVerticalPosition: 0,
          showZoom: true,
          opacity: 1.0,
        ),
      ) {
    photoViewController.outputStateStream.listen((
      PhotoViewControllerValue value,
    ) {
      final actualScale = value.scale ?? 1.0;
      initialScale ??= actualScale;
      logicalScale = actualScale / initialScale!;

      _emitCurrentState();
    });
  }

  final PhotoViewController photoViewController = PhotoViewController();

  final List<int> pointerIds = [];

  double logicalScale = 1.0;
  Offset dragStartPosition = Offset(0, 0);
  double dragVerticalPosition = 0;
  final double dragThreshold;
  bool showZoom = true;
  double? initialScale;
  
 final _popController = StreamController<void>.broadcast();
  Stream<void> get popStream => _popController.stream;

  void dragStart(DragStartDetails details) {
    dragStartPosition = details.localPosition;
  }

  void dragUpdate(DragUpdateDetails details) {
    final dragDistance = details.localPosition.dy - dragStartPosition.dy;

    if (dragDistance.abs() > dragThreshold) {
      dragVerticalPosition += details.delta.dy;
      showZoom = false;
    }

    _emitCurrentState();
  }

  void dragEnd(DragEndDetails details) {
    if (dragVerticalPosition.abs() > dragThreshold) {
      _popController.add(null);
    } else {
      dragVerticalPosition = 0;
      showZoom = true;
      _emitCurrentState();
    }
  }

  void onPointerDown(PointerDownEvent event) {
    if (dragVerticalPosition == 0) {
      pointerIds.add(event.pointer);
    }
    _emitCurrentState();
  }

 
  void onPointerUp(PointerUpEvent event) {
    pointerIds.remove(event.pointer);
    _emitCurrentState();
  }

  void onPointerCancel(PointerCancelEvent event) {
    pointerIds.remove(event.pointer);
    _emitCurrentState();
  }

  double _calculateOpacity() {
    if (pointerIds.isEmpty && dragVerticalPosition != 0) {
      return 0.0;
    } else if (dragVerticalPosition != 0) {
      return (1 - (dragVerticalPosition.abs() / 200)).clamp(0.5, 1.0);
    } else {
      return 1.0;
    }
  }

  void restartObacityValue() {
    emit(
      QuestionImageDetails(
        logicalScale: logicalScale,
        dragVerticalPosition: dragVerticalPosition,
        showZoom: false,
        pointerIds: pointerIds,
        opacity: 0,
      ),
    );
  }

  void _emitCurrentState() {
    emit(
      QuestionImageDetails(
        logicalScale: logicalScale,
        dragVerticalPosition: dragVerticalPosition,
        showZoom: showZoom,
        pointerIds: pointerIds,
        opacity: _calculateOpacity(),
      ),
    );
  }
}
