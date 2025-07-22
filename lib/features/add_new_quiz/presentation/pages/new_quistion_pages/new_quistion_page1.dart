import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/new_quistion_pages/new_quistion_page1_body.dart';

class NewQuistionPage1 extends StatelessWidget {
  const NewQuistionPage1({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return NewQuistionPage1Body(onNext: onNext);
  }
}
