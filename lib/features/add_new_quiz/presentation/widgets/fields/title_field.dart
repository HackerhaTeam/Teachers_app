import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/widgets/text_field/custom_text_field.dart';

import '../../../../../core/widgets/text_field/field_validators.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.titleController,
    required this.focusNode,
    this.onChanged,
    this.onSubmitted,
    required this.titleKey,
    required this.titleSubmitted,
  });

  final TextEditingController titleController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> titleKey;
  final bool titleSubmitted;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: titleKey,
      autovalidateMode:
          titleSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
      child: SizedBox(
        width: 364.w(context),
        height: 59,
        child: Center(
          child: CustomTextField(
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            fieldType: FieldType.title,
            label: "عنوان الاختبار",

            radius: 8.r(context),
            controller: titleController,
          ),
        ),
      ),
    );
  }
}
