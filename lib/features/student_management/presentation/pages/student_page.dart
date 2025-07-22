import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/student/presentation/manager/student_list_cubit.dart';
import 'package:teacher_hackerha/features/student/presentation/widgets/shared/section/student_page_content.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key, required this.isGeneralPage});

final bool isGeneralPage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentListCubit(),
      child: SafeArea(child: Scaffold(body: StudentPageContent(isManagePage: isGeneralPage,))),
    );
  }
}
