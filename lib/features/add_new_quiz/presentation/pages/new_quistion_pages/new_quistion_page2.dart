import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/manager/cubit/image_upload_cubit.dart';

import '../../widgets/new_quistion_pages/new_quistion_page2_body.dart';

class NewQuistionPage2 extends StatelessWidget {
  const NewQuistionPage2({super.key, required this.onNext});
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageUploadCubit(),
      child: NewQuistionPage2Body(onNext: onNext),
    );
  }
}
