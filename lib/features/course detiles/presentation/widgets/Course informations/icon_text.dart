import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,

    required this.title, this.mainAxisAlignment,  this.iconColor,
  });

  final PhosphorIconData icon;
  final MainAxisAlignment? mainAxisAlignment;
  
  final String title;
final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    
    var secondary = content.secondary;
    return Row(mainAxisAlignment:mainAxisAlignment??MainAxisAlignment.center,
      children: [
        PhosphorIcon(
          icon,
          size: 16.w(context),
          color: iconColor??secondary,
        ),
        SizedBox(
          width: 6.w(context),
        ),
        Text(
          title,
          style: context.xLabelSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
