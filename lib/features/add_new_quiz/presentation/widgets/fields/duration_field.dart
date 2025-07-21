import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/widgets/text_field/custom_text_field.dart';

import '../../../../../core/widgets/text_field/field_validators.dart';

class DurationField extends StatelessWidget {
  const DurationField({
    super.key,
    required this.durationController,
    required this.focusNode,
    this.onChanged,
    this.onSubmitted,
    required this.durationKey,
    required this.durationSubmitted,
  });

  final TextEditingController durationController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> durationKey;
  final bool durationSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: durationKey,
      autovalidateMode:
          durationSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
      child: SizedBox(
        width: 175.w(context),
        height: 59,
        child: Center(
          child: CustomTextField(
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,

            fieldType: FieldType.duration,
            label: "مدة الامتحان",
            radius: 8.r(context),
            controller: durationController,
          ),
        ),
      ),
    );
  }
}
