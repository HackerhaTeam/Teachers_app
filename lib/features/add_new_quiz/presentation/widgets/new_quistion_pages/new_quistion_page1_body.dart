import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/buttons/floating_next_button.dart';
import 'package:teacher_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/degree_field.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/groub_selector.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/title_field.dart';

class NewQuistionPage1Body extends StatefulWidget {
  const NewQuistionPage1Body({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<NewQuistionPage1Body> createState() => _NewQuistionPage1BodyState();
}

class _NewQuistionPage1BodyState extends State<NewQuistionPage1Body> {
  final GlobalKey<FormState> groubKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGroub;
  bool groubSubmitted = false;
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> titleKey = GlobalKey<FormState>();
  final FocusNode titleFocusNode = FocusNode();
  bool titleSubmitted = false;
  final TextEditingController degreeController = TextEditingController();
  final GlobalKey<FormState> degreeKey = GlobalKey<FormState>();
  final FocusNode degreeFocusNode = FocusNode();
  bool degreeSubmitted = false;
  List<String> grobs = ["عشوائي (لا يتبع لأي مجموعة)", "مجموعة جديدة"];
  List<String> userGroups = [];
  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    return Scaffold(
      floatingActionButton: FloatingNextButton(
        formKey: formKey,
        onNext: () {
          setState(() {
            groubSubmitted = true;
            titleSubmitted = true;
            degreeSubmitted = true;
          });
          final isFormValid = formKey.currentState?.validate() ?? false;
          final groubValidate = groubKey.currentState?.validate() ?? false;
          // final titleValidate = titleKey.currentState?.validate() ?? false;
          final degreeValidate = degreeKey.currentState?.validate() ?? false;
          if (groubValidate && degreeValidate && isFormValid) {
            widget.onNext();
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntroductionHeader(
                introText: "بيانات السؤال الأساسية",
                icon: PhosphorIcons.database(),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "أدخل البيانات الرئيسية للسؤال",
                    style: context.xParagraphLargeLose.copyWith(
                      color: content.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              GroubSellector(
                groubs: grobs,
                selectedGroub: selectedGroub,
                onChanged: (value) {
                  setState(() {
                    selectedGroub = value;
                    titleController.clear();
                  });
                },
                groubKey: groubKey,
                groubSubmitted: groubSubmitted,
              ),
              if (selectedGroub == "مجموعة جديدة" ||
                  selectedGroub == titleController.text)
                SizedBox(height: 12),
              if (selectedGroub == "مجموعة جديدة" ||
                  selectedGroub == titleController.text)
                Padding(
                  padding: EdgeInsets.only(right: 2),
                  child: TitleField(
                    onSubmitted: (_) {
                      final newGroupName = titleController.text.trim();

                      if (newGroupName.isNotEmpty &&
                          !userGroups.contains(newGroupName) &&
                          newGroupName != "عشوائي (لا يتبع لأي مجموعة)" &&
                          newGroupName != "مجموعة جديدة") {
                        setState(() {
                          userGroups.insert(0, newGroupName);
                          grobs = [
                            ...userGroups,
                            "عشوائي (لا يتبع لأي مجموعة)",
                            "مجموعة جديدة",
                          ];
                          selectedGroub = newGroupName;
                        });
                      }
                      degreeFocusNode.requestFocus();
                    },

                    titleController: titleController,
                    focusNode: titleFocusNode,
                    titleKey: titleKey,
                    titleSubmitted: titleSubmitted,
                    title: 'اسم المجموعة',
                  ),
                ),
              SizedBox(height: 12),
              DegreeField(
                width: 363.w(context),
                degreeController: degreeController,
                focusNode: degreeFocusNode,
                degreeKey: degreeKey,
                degreeSubmitted: degreeSubmitted,
                title: "درجة السؤال",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
