import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/top%20teacher/top_teacher_cubit.dart';

import 'package:teacher_hackerha/features/home/presentation/widgets/top_teachers_builder.dart';

class MonthlyTrainerPageView extends StatefulWidget {
  const MonthlyTrainerPageView({
    super.key,
  
    required this.bg,
    required this.borders,
  });


  final AppBackgrounds bg;
  final AppBorders borders;

  @override
  State<MonthlyTrainerPageView> createState() => _MonthlyTrainerPageViewState();
}

class _MonthlyTrainerPageViewState extends State<MonthlyTrainerPageView> {
  late final PageController _controller;
  late final Timer _timer;
  final int _pageCount = 2;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8, keepPage: false);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_controller.hasClients) {
        _currentPage++;
        if (_currentPage >= _pageCount) _currentPage = 0;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>();
    final bg = widget.bg;
    final border = widget.borders;

  return  BlocBuilder<TopTeacherCubit, TopTeacherState>(
  builder: (context, state) {
  return  buildTopTeachers(state,context,_controller,bg,border,content!);
     },
  
); 
 
}

}
