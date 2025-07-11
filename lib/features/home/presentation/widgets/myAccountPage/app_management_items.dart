// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/myAccountPage/my_account_menu_item.dart';


class AppManagementItems extends StatelessWidget {
  const AppManagementItems({super.key});

  @override
  Widget build(BuildContext context) {
    final appBorders = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
      margin: EdgeInsets.symmetric(horizontal: 20.w(context)),
      width: double.infinity,
      padding: EdgeInsets.all(16.w(context)),
      borderRadius: 16.r(context),
      borderColor: appBorders.transparent ,
      child: Column(
        children: [
          MyAccountMenuItem(
              icon: PhosphorIcons.chatsTeardrop(), title: "تواصل معنا"),
          SizedBox(height: 12),
          MyAccountMenuItem(icon: PhosphorIcons.info(), title: "حول التطبيق"),
          SizedBox(height: 12),
          MyAccountMenuItem(
              icon: PhosphorIcons.gift(), title: "شارك رابط التطبيق"),
          SizedBox(height: 12),
          MyAccountMenuItem(
              icon: PhosphorIcons.signOut(),
              title: "تسجيل الخروج",
              therIsBreake: false),
        ],
      ),
    );
  }
}
