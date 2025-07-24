import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/manager/cubit/image_upload_cubit.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/image_upload_field/image_upload_field.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/quistion_text.dart';

class NewQuistionPage2Body extends StatefulWidget {
  const NewQuistionPage2Body({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<NewQuistionPage2Body> createState() => _NewQuistionPage2BodyState();
}

class _NewQuistionPage2BodyState extends State<NewQuistionPage2Body> {
  final TextEditingController quistionController = TextEditingController();
  final TextEditingController descreptionController = TextEditingController();
  final GlobalKey<FormState> quistionKey = GlobalKey<FormState>();
  final FocusNode quistionFocusNode = FocusNode();
  final FocusNode descreptionFocusNode = FocusNode();
  bool quistionSubmitted = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      quistionFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionHeader(
                introText: "نص السؤال",
                icon: PhosphorIcons.questionMark(),
              ),
              SizedBox(height: 8),
              Text(
                "اكتب نصّ السؤال الرئيسي أدناه وأضف صورة إن شئت.",
                style: context.xParagraphLargeLose.copyWith(
                  color: content.secondary,
                ),
              ),
              SizedBox(height: 32),
              QuistionTextField(
                quistionController: quistionController,
                focusNode: quistionFocusNode,
                quistionKey: quistionKey,
                quistionSubmitted: quistionSubmitted,
              ),
              SizedBox(height: 16),
              const ImageUploadField(),
              SizedBox(height: 20),

              BlocBuilder<ImageUploadCubit, ImageUploadState>(
                builder: (context, state) {
                  final enabled = state is ImageUploadSuccess;
                  return QuistionTextField(
                    enabled: enabled,
                    quistionController: descreptionController,
                    focusNode: descreptionFocusNode,
                    hint: "وصف السؤال (اختياري)",
                    quistionSubmitted: quistionSubmitted,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
