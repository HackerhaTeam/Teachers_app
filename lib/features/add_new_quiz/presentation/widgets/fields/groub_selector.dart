import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/widgets/custom_dropdownfield.dart';

class GroubSellector extends StatelessWidget {
  const GroubSellector({
    super.key,
    required this.selectedGroub,
    required this.onChanged,
    required this.groubKey,
    required this.groubSubmitted,
    this.groubs,
  });
  final List<String>? groubs;

  final String? selectedGroub;
  final dynamic Function(String?) onChanged;
  final GlobalKey<FormState> groubKey;
  final bool groubSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: groubKey,
      autovalidateMode:
          groubSubmitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
      child: Center(
        child: SizedBox(
          width: 365.w(context),
          height: 61,
          child: CustomDropdown(
            label: "اختر الكروب الذي يتبع لهذا السؤال",
            items: groubs ?? ["عشوائي (لا يتبع لأي مجموعة)", "مجموعة جديدة"],
            selectedValue: selectedGroub,
            onChanged: onChanged,
            type: DropdownType.groubs,
          ),
        ),
      ),
    );
  }
}
