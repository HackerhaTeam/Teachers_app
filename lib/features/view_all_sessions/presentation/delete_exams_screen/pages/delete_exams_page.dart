import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/widgets/delete_exams_content.dart';

class DeleteExamsPage extends StatelessWidget {
  const DeleteExamsPage({super.key, required this.items});
  final List<Map<String, dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteExamsCubit(items: items),
      child: SafeArea(child: Scaffold(body: DeleteExamsContent())),
    );
  }
}



