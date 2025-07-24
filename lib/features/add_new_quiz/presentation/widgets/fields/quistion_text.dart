import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/widgets/text_field/custom_text_field.dart';

import '../../../../../core/widgets/text_field/field_validators.dart';

class QuistionTextField extends StatelessWidget {
  const QuistionTextField({
    super.key,
    required this.quistionController,
    required this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.quistionKey,
    required this.quistionSubmitted,
    this.enabled,
    this.hint,
  });

  final TextEditingController quistionController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState>? quistionKey;
  final bool quistionSubmitted;
  final bool? enabled;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: quistionKey,
      autovalidateMode:
          quistionSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
      child: SizedBox(
        width: 361.w(context),
        height: 59,
        child: Center(
          child: CustomTextField(
            enabled: enabled,
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,

            fieldType: FieldType.quistion,
            label: hint ?? "نص السؤال",

            radius: 8.r(context),
            controller: quistionController,
          ),
        ),
      ),
    );
  }
}
