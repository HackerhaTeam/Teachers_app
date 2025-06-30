// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/myAccountPage/my_information_photo.dart';

class MyInformationListTile extends StatelessWidget {
  const MyInformationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const MyInformationPhoto(),
      title: const Text("محمد المحمد"),
      subtitle: Text("هنا يظهر للأستاذ الوصف الذي قام بإدخاله والنص ال",
              style: context.xParagraphMedium, overflow: TextOverflow.ellipsis),
    );
  }
}
