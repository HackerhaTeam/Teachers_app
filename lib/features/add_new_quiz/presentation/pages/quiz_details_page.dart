import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/quiz_details_page_body.dart';

class QuizDetailsPage extends StatelessWidget {
  const QuizDetailsPage({super.key, required this.degree});
  final String degree;
  @override
  Widget build(BuildContext context) {
    return QuizDetailsPageBody(degree: degree);
  }
}
