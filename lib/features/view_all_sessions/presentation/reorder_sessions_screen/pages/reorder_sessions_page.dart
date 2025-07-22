import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/manager/reorder_sessions_list_cubit/reorder_sessions_list_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/reorder_sessions_screen/widgets/reorder_sessions_content.dart';

class ReorderSessionsPage extends StatelessWidget {
  const ReorderSessionsPage({super.key, required this.items});
  final List<Map<String, dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReorderSessionsListCubit(items: items),
      child: SafeArea(child: Scaffold(body: ReorderSessionsContent())),
    );
  }
}




