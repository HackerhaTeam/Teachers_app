
import 'dart:async';

import 'package:flutter/material.dart';

class LongPointerListener extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback onLongPointerDown;

  const LongPointerListener({
    required this.child,
    required this.onLongPointerDown,
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });

  @override
  State<LongPointerListener> createState() => _LongPointerListenerState();
}

class _LongPointerListenerState extends State<LongPointerListener> {
  Timer? _timer;

  void _startTimer() {
    _timer = Timer(widget.duration, widget.onLongPointerDown);
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _startTimer(),
      onPointerUp: (_) => _cancelTimer(),
      onPointerCancel: (_) => _cancelTimer(),
      child: widget.child,
    );
  }
}
