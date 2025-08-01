import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/drawer/advanced_theme_switcher.dart';

class DrawerHeadding extends StatelessWidget {
  final void Function()? onClose;

  const DrawerHeadding({
    super.key,
    required this.onClose, required this.animationController,
  });
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
  
    final contentColor = Theme.of(context).extension<AppContent>();
    
    return Row(
      children: [
        GestureDetector(
          onTap: onClose,
          child: AnimatedIcon(
            color: contentColor!.brandPrimary,
            icon: AnimatedIcons.menu_close,
            progress: animationController,
          ),
        ),
        Text(
          "إغلاق",
          style:
          context.xLabelXLarge.copyWith(color: contentColor.brandPrimary),
        ),
        SizedBox(width: 12.w(context)),
        const Spacer(),
        AdvancedThemeSwitcher(),
      ],
    );
  }
}