import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/functions/navigation.dart';
import 'package:teacher_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/floating_next_button.dart';
import 'package:teacher_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/pages/quiz_details_page.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/degree_field.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/duration_field.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/title_field.dart';

import '../../../../core/widgets/custom_circle_icon.dart';

class NewQuizPageBody extends StatefulWidget {
  const NewQuizPageBody({super.key});

  @override
  State<NewQuizPageBody> createState() => _NewQuizPageBodyState();
}

class _NewQuizPageBodyState extends State<NewQuizPageBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController degreeController = TextEditingController();
  final GlobalKey<FormState> degreeKey = GlobalKey<FormState>();
  final FocusNode degreeFocusNode = FocusNode();
  bool degreeSubmitted = false;
  final TextEditingController durationController = TextEditingController();
  final GlobalKey<FormState> durationKey = GlobalKey<FormState>();
  final FocusNode durationFocusNode = FocusNode();
  bool durationSubmitted = false;
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> titleKey = GlobalKey<FormState>();
  final FocusNode titleFocusNode = FocusNode();
  bool titleSubmitted = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      degreeFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Scaffold(
      floatingActionButton: FloatingNextButton(
        width: 133.w(context),
        buttonText: "إضافة الاختبار",
        formKey: formKey,
        onNext: () {
          setState(() {
            degreeSubmitted = true;
            durationSubmitted = true;
            titleSubmitted = true;
          });
          final degreeValidate = degreeKey.currentState?.validate() ?? false;
          final titleValidate = titleKey.currentState?.validate() ?? false;
          final durationValidate =
              durationKey.currentState?.validate() ?? false;
          final isFormValid = formKey.currentState?.validate() ?? false;
          if (degreeValidate &&
              durationValidate &&
              titleValidate &&
              isFormValid) {
            context.navigateWithSlideTransition(
              QuizDetailsPage(degree: degreeController.text),
            );
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCircleIcon(
                  circleSize: 44.s(context),
                  backgroundColor: backgrounds.onSurfaceSecondary,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  iconAsset: getThemeIcon(
                    context,
                    AppImages.carretRightDark,
                    AppImages.carretRightLight,
                  ),
                  iconSize: 24.s(context),
                ),
                IntroductionHeader(
                  introText: "المعلومات الأساسية للاختبار",
                  icon: PhosphorIcons.database(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.h(context),
                    bottom: 32.h(context),
                  ),
                  child: Text(
                    'اختر الرقم الذي ترغب في عرض السؤال من خلاله وحدد درجته.',
                    style: context.xParagraphLargeLose,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DegreeField(
                      onSubmitted: (p0) {
                        durationFocusNode.requestFocus();
                        degreeController.text = p0;
                      },
                      degreeController: degreeController,
                      focusNode: degreeFocusNode,
                      degreeKey: degreeKey,
                      degreeSubmitted: degreeSubmitted,
                      title: "درجة الامتحان الكلية",
                    ),
                    SizedBox(width: 8),
                    DurationField(
                      onSubmitted: (p0) {
                        titleFocusNode.requestFocus();
                      },
                      durationController: durationController,
                      focusNode: durationFocusNode,
                      durationKey: durationKey,
                      durationSubmitted: durationSubmitted,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                TitleField(
                  titleController: titleController,
                  focusNode: titleFocusNode,
                  titleKey: titleKey,
                  titleSubmitted: titleSubmitted,
                  title: 'عنوان الاختبار',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
