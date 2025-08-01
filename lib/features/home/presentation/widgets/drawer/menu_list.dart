import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/drawer/custom_list_tile.dart';

import '../../../../../core/widgets/gradient_divider.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>();

    return Column(
      children: [
        Row(
          children: [
            Text(
              "القائمة",
              style: context.xHeadingSmall
                  .copyWith(color: contentColor!.secondary),
            ),
          ],
        ),
        SizedBox(height: 16.h(context)),
        Column(
          children: [
            _buildMenuItem(
              icon: PhosphorIcons.user(),
              title: "حسابي",
              color: contentColor.primary,
            ),
            _buildMenuItem(
              icon: PhosphorIcons.student(),
              title: "طلابي",
              color: contentColor.primary,
            ),
            _buildMenuItem(
              icon: PhosphorIcons.magnifyingGlass(),
              title: "البحث",
              color: contentColor.primary,
              onTap: () {
                //context.navigateWithSlideTransition(SearchPage());
              },
            ),
            
            
            _buildMenuItem(
              icon: PhosphorIcons.cardsThree(),
              title: "إصدار التطبيق 1.0.0",
              color: contentColor.secondary,
            ),
            SizedBox(height: 16.h(context)),
            GradientDivider(),
            SizedBox(height: 16.h(context)),
            _buildMenuItem(
              icon: PhosphorIcons.signOut(),
              title: "تسجيل الخروج",
              color: contentColor.negative,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      {required PhosphorIconData icon,
        required String title,
        required Color color,
        void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: CustomListTile(
        phosphorIcondata: icon,
        title: title,
        color: color,
      ),
    );
  }
}