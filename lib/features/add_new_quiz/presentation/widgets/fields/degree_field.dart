import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/widgets/text_field/custom_text_field.dart';

import '../../../../../core/widgets/text_field/field_validators.dart';

class DegreeField extends StatelessWidget {
  const DegreeField({
    super.key,
    required this.degreeController,
    required this.focusNode,
    this.onChanged,
    this.onSubmitted,
    required this.degreeKey,
    required this.degreeSubmitted,
  });

  final TextEditingController degreeController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final GlobalKey<FormState> degreeKey;
  final bool degreeSubmitted;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: degreeKey,
      autovalidateMode:
          degreeSubmitted
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
            keyboardType: TextInputType.number,
            fieldType: FieldType.degree,
            label: "درجة الامتحان الكلية",

            radius: 8.r(context),
            controller: degreeController,
          ),
        ),
      ),
    );
  }
}
