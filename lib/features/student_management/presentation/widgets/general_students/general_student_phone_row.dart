import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class GeneralStudentPhoneRow extends StatelessWidget {
  const GeneralStudentPhoneRow({super.key});

  final String phoneNumber = '+963 912 345 678';

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Row(
      children: [
        Text(
          'رقم الهاتف',
          style: context.xLabelMedium.copyWith(color: contentColor.secondary),
        ),
        SizedBox(width: 60.w(context)),
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: phoneNumber));
          },
          child: Row(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  phoneNumber,
                  style: context.xLabelMedium.copyWith(
                    color: contentColor.brandPrimary,
                  ),
                ),
              ),
              SizedBox(width: 4.w(context)),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PhosphorIcon(
                  PhosphorIcons.copySimple(),
                  size: 16.s(context),
                  color: contentColor.brandPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
