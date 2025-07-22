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
    required this.title,
  });

  final TextEditingController titleController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> titleKey;
  final bool titleSubmitted;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: titleKey,
      autovalidateMode:
          titleSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
      child: SizedBox(
        width: 361.w(context),
        height: 59,
        child: Center(
          child: CustomTextField(
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,

            fieldType: FieldType.title,
            label: title,

            radius: 8.r(context),
            controller: titleController,
          ),
        ),
      ),
    );
  }
}
