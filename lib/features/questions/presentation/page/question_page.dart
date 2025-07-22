import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/questions/presentation/widgets/sections/quiz_page_content.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: QuestionPageContent()));
  }
}
